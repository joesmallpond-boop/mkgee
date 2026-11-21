#include "PluginProcessor.h"
#include "PluginEditor.h"

juce::String MkgeeRigProcessor::unitSuffix (int unit)
{
    switch (unit)
    {
        case 2: return " ms";
        case 3: return " Hz";
        case 4: return " dB";
        case 5: return " %";
        case 7: return " st";
        default: return {};
    }
}

juce::AudioProcessorValueTreeState::ParameterLayout MkgeeRigProcessor::createLayout()
{
    juce::AudioProcessorValueTreeState::ParameterLayout layout;

    for (auto& p : mkgee::kParams)
    {
        const juce::String id (p.id);
        const juce::String name = juce::String (p.section) + " " + p.label;
        const juce::ParameterID pid { id, 1 };

        if (p.kind == 1)
        {
            layout.add (std::make_unique<juce::AudioParameterBool> (pid, name, p.def > 0.5f));
        }
        else if (p.kind == 2)
        {
            layout.add (std::make_unique<juce::AudioParameterChoice> (pid, name,
                juce::StringArray { p.choiceA, p.choiceB }, (int) p.def));
        }
        else if (p.unit == 7 || p.unit == 0)
        {
            layout.add (std::make_unique<juce::AudioParameterInt> (pid, name, (int) p.min, (int) p.max, (int) p.def,
                juce::AudioParameterIntAttributes().withLabel (unitSuffix (p.unit).trim())));
        }
        else
        {
            juce::NormalisableRange<float> range (p.min, p.max);
            if (p.expo != 1.0f)
                range.skew = 1.0f / p.expo;

            const int unit = p.unit;
            auto toText = [unit] (float v, int)
            {
                switch (unit)
                {
                    case 5: return juce::String (juce::roundToInt (v * 100.0f)) + " %";
                    case 3: return v >= 1000.0f ? juce::String (v / 1000.0f, 2) + " kHz"
                                                : juce::String (v, v < 10.0f ? 2 : 0) + " Hz";
                    case 2: return v >= 1000.0f ? juce::String (v / 1000.0f, 2) + " s"
                                                : juce::String (v, 0) + " ms";
                    case 4: return juce::String (v, 1) + " dB";
                    default: return juce::String (v, 2);
                }
            };
            auto fromText = [unit] (const juce::String& s)
            {
                auto v = s.getFloatValue();
                if (unit == 5) return v / 100.0f;
                if ((unit == 3 && s.containsIgnoreCase ("k")) || (unit == 2 && s.trim().endsWithIgnoreCase (" s")))
                    return v * 1000.0f;
                return v;
            };
            layout.add (std::make_unique<juce::AudioParameterFloat> (pid, name, range, p.def,
                juce::AudioParameterFloatAttributes()
                    .withStringFromValueFunction (toText)
                    .withValueFromStringFunction (fromText)));
        }
    }
    return layout;
}

MkgeeRigProcessor::MkgeeRigProcessor()
    : AudioProcessor (BusesProperties()
                        .withInput ("Input", juce::AudioChannelSet::stereo(), true)
                        .withOutput ("Output", juce::AudioChannelSet::stereo(), true)),
      apvts (*this, nullptr, "MKGEE_RIG", createLayout())
{
    for (int i = 0; i < mkgee::kNumParams; ++i)
        raw[(size_t) i] = apvts.getRawParameterValue (mkgee::kParams[i].id);
}

bool MkgeeRigProcessor::isBusesLayoutSupported (const BusesLayout& layouts) const
{
    if (layouts.getMainOutputChannelSet() != juce::AudioChannelSet::stereo())
        return false;
    const auto in = layouts.getMainInputChannelSet();
    return in == juce::AudioChannelSet::mono() || in == juce::AudioChannelSet::stereo();
}

void MkgeeRigProcessor::prepareToPlay (double sampleRate, int samplesPerBlock)
{
    dsp.prepare (sampleRate);
    scratch.setSize (2, juce::jmax (1, samplesPerBlock));
}

void MkgeeRigProcessor::processBlock (juce::AudioBuffer<float>& buffer, juce::MidiBuffer&)
{
    juce::ScopedNoDenormals noDenormals;
    const int n = buffer.getNumSamples();
    const int numIn = getTotalNumInputChannels();

    for (int i = 0; i < mkgee::kNumParams; ++i)
        dsp.P[i] = (double) raw[(size_t) i]->load();

    if (scratch.getNumSamples() < n)
        scratch.setSize (2, n, false, false, true);

    const float* l = buffer.getReadPointer (0);
    const float* r = numIn > 1 ? buffer.getReadPointer (1) : l;
    scratch.copyFrom (0, 0, l, n);
    scratch.copyFrom (1, 0, r, n);

    inPeak.store (juce::jmax (inPeak.load() * 0.9f, scratch.getMagnitude (0, 0, n)));

    dsp.process (scratch.getReadPointer (0), scratch.getReadPointer (1),
                 buffer.getWritePointer (0), buffer.getWritePointer (1), n);

    outPeak.store (juce::jmax (outPeak.load() * 0.9f, buffer.getMagnitude (0, 0, n)));
}

void MkgeeRigProcessor::getStateInformation (juce::MemoryBlock& destData)
{
    if (auto xml = apvts.copyState().createXml())
        copyXmlToBinary (*xml, destData);
}

void MkgeeRigProcessor::setStateInformation (const void* data, int sizeInBytes)
{
    if (auto xml = getXmlFromBinary (data, sizeInBytes))
        if (xml->hasTagName (apvts.state.getType()))
            apvts.replaceState (juce::ValueTree::fromXml (*xml));
}

juce::AudioProcessorEditor* MkgeeRigProcessor::createEditor()
{
    return new MkgeeRigEditor (*this);
}

juce::AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new MkgeeRigProcessor();
}
