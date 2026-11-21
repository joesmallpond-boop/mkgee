#pragma once
#include <juce_audio_processors/juce_audio_processors.h>
#include "MkgeeDSP.h"

class MkgeeRigProcessor : public juce::AudioProcessor
{
public:
    MkgeeRigProcessor();
    ~MkgeeRigProcessor() override = default;

    void prepareToPlay (double sampleRate, int samplesPerBlock) override;
    void releaseResources() override {}
    bool isBusesLayoutSupported (const BusesLayout& layouts) const override;
    void processBlock (juce::AudioBuffer<float>&, juce::MidiBuffer&) override;
    using AudioProcessor::processBlock;

    juce::AudioProcessorEditor* createEditor() override;
    bool hasEditor() const override { return true; }

    const juce::String getName() const override { return "MKGEE RIG"; }
    bool acceptsMidi() const override { return false; }
    bool producesMidi() const override { return false; }
    bool isMidiEffect() const override { return false; }
    double getTailLengthSeconds() const override { return 8.0; }

    int getNumPrograms() override { return 1; }
    int getCurrentProgram() override { return 0; }
    void setCurrentProgram (int) override {}
    const juce::String getProgramName (int) override { return "Default"; }
    void changeProgramName (int, const juce::String&) override {}

    void getStateInformation (juce::MemoryBlock& destData) override;
    void setStateInformation (const void* data, int sizeInBytes) override;

    juce::AudioProcessorValueTreeState apvts;

    // for the UI
    std::atomic<float> inPeak { 0.0f }, outPeak { 0.0f }, prePeak { 0.0f };

    static juce::String unitSuffix (int unit);

private:
    static juce::AudioProcessorValueTreeState::ParameterLayout createLayout();
    mkgee::DSP dsp;
    std::array<std::atomic<float>*, mkgee::kNumParams> raw {};
    juce::AudioBuffer<float> scratch;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (MkgeeRigProcessor)
};
