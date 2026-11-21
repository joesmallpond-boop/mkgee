#pragma once
#include <juce_audio_utils/juce_audio_utils.h>
#include "PluginProcessor.h"

namespace ui
{
enum KnobStyle { Chicken = 0, Cream, BlackSkirt, Mixer, Chrome };

class LookAndFeel : public juce::LookAndFeel_V4
{
public:
    LookAndFeel();
    void drawRotarySlider (juce::Graphics&, int x, int y, int w, int h, float pos,
                           float startAngle, float endAngle, juce::Slider&) override;
    void drawLinearSlider (juce::Graphics&, int x, int y, int w, int h, float pos, float minPos, float maxPos,
                           juce::Slider::SliderStyle, juce::Slider&) override;
    juce::Font getSliderPopupFont (juce::Slider&) override { return juce::Font (juce::FontOptions (13.0f, juce::Font::bold)); }
};

class Knob : public juce::Component
{
public:
    Knob (juce::AudioProcessorValueTreeState&, const juce::String& id, const juce::String& label,
          KnobStyle, juce::Colour labelColour, juce::Colour cap = juce::Colours::white);
    void resized() override;
    void paint (juce::Graphics&) override;
    juce::Slider slider;
private:
    juce::String label;
    juce::Colour labelColour;
    std::unique_ptr<juce::AudioProcessorValueTreeState::SliderAttachment> att;
};

class Fader : public juce::Component
{
public:
    Fader (juce::AudioProcessorValueTreeState&, const juce::String& id, juce::Colour labelColour);
    void resized() override;
    void paint (juce::Graphics&) override;
    juce::Slider slider;
private:
    juce::Colour labelColour;
    std::unique_ptr<juce::AudioProcessorValueTreeState::SliderAttachment> att;
};

// footswitch / mini toggle / play key / channel-on rocker — all toggle buttons on a param
class ParamButton : public juce::Button
{
public:
    enum Kind { Foot, Mini, Play, Rocker };
    ParamButton (juce::AudioProcessorValueTreeState&, const juce::String& id, Kind,
                 juce::String a = {}, juce::String b = {}, juce::Colour textColour = juce::Colours::white);
    void paintButton (juce::Graphics&, bool over, bool down) override;
private:
    Kind kind;
    juce::String textA, textB;
    juce::Colour textColour;
    std::unique_ptr<juce::AudioProcessorValueTreeState::ButtonAttachment> att;
};

// one piece of gear in the chain
class Unit : public juce::Component
{
public:
    enum Body { Pedal, Plate, Strip, Deck };
    Unit (MkgeeRigProcessor&, Body, juce::Colour body, juce::Colour ink, juce::String name,
          juce::String sub, juce::String onParam);

    Knob& knob (const juce::String& id, const juce::String& label, KnobStyle, juce::Rectangle<int>,
                juce::Colour cap = juce::Colours::white);
    void fader (const juce::String& id, juce::Rectangle<int>);
    void button (const juce::String& id, ParamButton::Kind, juce::Rectangle<int>, juce::String a = {}, juce::String b = {});

    void paint (juce::Graphics&) override;
    void resized() override;
    void tick();

    int jackY = 70;
    float reelAngle = 0.0f;
    bool peak = false;

private:
    void paintPedal (juce::Graphics&);
    void paintPlate (juce::Graphics&);
    void paintStrip (juce::Graphics&);
    void paintDeck (juce::Graphics&);
    void paintScrews (juce::Graphics&, juce::Rectangle<float>);
    void paintLed (juce::Graphics&, juce::Point<float>, bool on, juce::Colour);
    bool isOn() const;

    MkgeeRigProcessor& proc;
    Body body;
    juce::Colour bodyColour, ink;
    juce::String name, sub, onParam;
    std::vector<std::pair<std::unique_ptr<juce::Component>, juce::Rectangle<int>>> parts;
    bool lastOn = false;
};

class Board : public juce::Component
{
public:
    explicit Board (MkgeeRigProcessor&);
    void paint (juce::Graphics&) override;
    void paintOverChildren (juce::Graphics&) override;
    void resized() override;
    void tick();
    static constexpr int W = 1604, H = 364;
private:
    MkgeeRigProcessor& proc;
    juce::OwnedArray<Unit> units;
    Unit* deck = nullptr;
    Unit* strip = nullptr;
};
} // namespace ui

class MkgeeRigEditor : public juce::AudioProcessorEditor, private juce::Timer
{
public:
    explicit MkgeeRigEditor (MkgeeRigProcessor&);
    ~MkgeeRigEditor() override;
    void paint (juce::Graphics&) override {}
    void resized() override;
private:
    void timerCallback() override { board.tick(); }
    ui::LookAndFeel lnf;
    ui::Board board;
};
