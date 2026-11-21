#include "PluginEditor.h"

using namespace juce;

namespace ui
{
static const Colour kCream (0xffeee4cc), kInk (0xff1a1a1a);

static Font font (float h, bool bold = true)
{
    return Font (FontOptions (h, bold ? Font::bold : Font::plain));
}

static float defaultFor (const String& id)
{
    for (auto& p : mkgee::kParams)
        if (id == p.id) return p.def;
    return 0.0f;
}

// =====================================================================================
LookAndFeel::LookAndFeel()
{
    setColour (BubbleComponent::backgroundColourId, Colour (0xf0151515));
    setColour (BubbleComponent::outlineColourId, Colour (0xffe8743b));
    setColour (TooltipWindow::textColourId, kCream);
}

void LookAndFeel::drawRotarySlider (Graphics& g, int x, int y, int w, int h, float pos,
                                    float a0, float a1, Slider& s)
{
    const auto style = (int) s.getProperties().getWithDefault ("knob", 0);
    const auto cap = Colour::fromString (s.getProperties().getWithDefault ("cap", "ffffffff").toString());
    const auto tickCol = Colour::fromString (s.getProperties().getWithDefault ("tick", "ffeee4cc").toString());
    auto r = Rectangle<float> ((float) x, (float) y, (float) w, (float) h).reduced (2.0f);
    const float size = jmin (r.getWidth(), r.getHeight());
    r = r.withSizeKeepingCentre (size, size);
    const auto c = r.getCentre();
    const float rad = size * 0.5f;
    const float ang = a0 + pos * (a1 - a0);

    // scale ticks printed on the panel
    g.setColour (tickCol.withAlpha (0.75f));
    for (int i = 0; i <= 10; ++i)
    {
        const float a = a0 + (a1 - a0) * (float) i / 10.0f;
        const float len = (i == 0 || i == 10 || i == 5) ? 4.0f : 2.0f;
        Point<float> p1 (c.x + std::sin (a) * rad, c.y - std::cos (a) * rad);
        Point<float> p2 (c.x + std::sin (a) * (rad - len), c.y - std::cos (a) * (rad - len));
        g.drawLine ({ p1, p2 }, 1.2f);
    }

    auto body = r.reduced (size * 0.13f);
    const float br = body.getWidth() * 0.5f;

    // drop shadow
    g.setColour (Colours::black.withAlpha (0.45f));
    g.fillEllipse (body.translated (1.5f, 2.5f));

    auto pointer = [&] (Colour col, float from, float to, float thick)
    {
        Path p;
        p.addRoundedRectangle (-thick * 0.5f, -br * to, thick, br * (to - from), thick * 0.5f);
        g.setColour (col);
        g.fillPath (p, AffineTransform::rotation (ang).translated (c));
    };

    switch (style)
    {
        case Chicken:
        {
            g.setGradientFill (ColourGradient (Colour (0xff3a3a3a), c.x, body.getY(), Colour (0xff0d0d0d), c.x, body.getBottom(), false));
            g.fillEllipse (body);
            // chicken-head pointer
            Path head;
            head.startNewSubPath (0.0f, -br * 1.08f);
            head.quadraticTo (br * 0.42f, -br * 0.2f, br * 0.36f, br * 0.55f);
            head.quadraticTo (0.0f, br * 0.8f, -br * 0.36f, br * 0.55f);
            head.quadraticTo (-br * 0.42f, -br * 0.2f, 0.0f, -br * 1.08f);
            head.closeSubPath();
            auto t = AffineTransform::rotation (ang).translated (c);
            g.setColour (Colours::black.withAlpha (0.5f));
            g.fillPath (head, t.translated (1.0f, 2.0f));
            g.setGradientFill (ColourGradient (Colour (0xff2b2b2b), c.x - br, c.y - br, Colour (0xff050505), c.x + br, c.y + br, false));
            g.fillPath (head, t);
            pointer (kCream, 0.25f, 1.0f, 2.2f);
            break;
        }
        case Cream:
        {
            g.setGradientFill (ColourGradient (Colour (0xfff7efd9), c.x - br * 0.4f, c.y - br, Colour (0xffbfb29a), c.x + br * 0.5f, c.y + br, true));
            g.fillEllipse (body);
            g.setColour (Colour (0xff8d826d));
            g.drawEllipse (body, 1.0f);
            g.setColour (Colour (0x30ffffff));
            g.fillEllipse (body.reduced (br * 0.35f).translated (-br * 0.12f, -br * 0.15f));
            pointer (kInk, 0.15f, 0.92f, 2.4f);
            break;
        }
        case BlackSkirt:
        {
            g.setColour (Colour (0xff141414));
            g.fillEllipse (body);
            g.setColour (Colour (0xff2c2c2c));
            for (int i = 0; i < 24; ++i)  // knurling
            {
                const float a = MathConstants<float>::twoPi * (float) i / 24.0f + ang;
                g.drawLine (c.x + std::sin (a) * br * 0.72f, c.y - std::cos (a) * br * 0.72f,
                            c.x + std::sin (a) * br * 0.98f, c.y - std::cos (a) * br * 0.98f, 1.0f);
            }
            auto top = body.reduced (br * 0.3f);
            g.setGradientFill (ColourGradient (Colour (0xff3d3d3d), top.getX(), top.getY(), Colour (0xff111111), top.getRight(), top.getBottom(), false));
            g.fillEllipse (top);
            pointer (Colours::white, 0.2f, 0.98f, 2.0f);
            break;
        }
        case Mixer:
        {
            g.setGradientFill (ColourGradient (Colour (0xff4a4a4a), c.x, body.getY(), Colour (0xff1c1c1c), c.x, body.getBottom(), false));
            g.fillEllipse (body);
            auto top = body.reduced (br * 0.22f);
            g.setGradientFill (ColourGradient (cap.brighter (0.25f), top.getX(), top.getY(), cap.darker (0.35f), top.getRight(), top.getBottom(), false));
            g.fillEllipse (top);
            pointer (Colours::white, 0.0f, 0.95f, 2.0f);
            break;
        }
        default: // Chrome
        {
            ColourGradient grad (Colour (0xfff2f2f2), c.x - br, c.y - br, Colour (0xff6d6d6d), c.x + br, c.y + br, false);
            grad.addColour (0.5, Colour (0xffb9b9b9));
            g.setGradientFill (grad);
            g.fillEllipse (body);
            g.setColour (Colour (0xff4a4a4a));
            g.drawEllipse (body, 1.0f);
            auto top = body.reduced (br * 0.18f);
            g.setGradientFill (ColourGradient (Colour (0xffdedede), top.getX(), top.getY(), Colour (0xff9a9a9a), top.getRight(), top.getBottom(), false));
            g.fillEllipse (top);
            pointer (kInk, 0.15f, 0.9f, 2.2f);
            break;
        }
    }
}

void LookAndFeel::drawLinearSlider (Graphics& g, int x, int y, int w, int h, float pos, float, float,
                                    Slider::SliderStyle, Slider&)
{
    auto r = Rectangle<float> ((float) x, (float) y, (float) w, (float) h);
    const float cx = r.getCentreX();
    // slot
    g.setColour (Colour (0xff111111));
    g.fillRoundedRectangle (cx - 2.5f, r.getY() - 4.0f, 5.0f, r.getHeight() + 8.0f, 2.5f);
    // scale
    g.setColour (kInk.withAlpha (0.8f));
    for (int i = 0; i <= 10; ++i)
    {
        const float yy = r.getY() + r.getHeight() * (float) i / 10.0f;
        const float len = (i % 5 == 0) ? 9.0f : 5.0f;
        g.drawLine (cx - 9.0f - len, yy, cx - 9.0f, yy, 1.0f);
        g.drawLine (cx + 9.0f, yy, cx + 9.0f + len, yy, 1.0f);
    }
    // cap
    auto capR = Rectangle<float> (0, 0, 30.0f, 20.0f).withCentre ({ cx, pos });
    g.setColour (Colours::black.withAlpha (0.5f));
    g.fillRoundedRectangle (capR.translated (1.5f, 3.0f), 3.0f);
    g.setGradientFill (ColourGradient (Colour (0xff5b5b5b), capR.getX(), capR.getY(), Colour (0xff1e1e1e), capR.getX(), capR.getBottom(), false));
    g.fillRoundedRectangle (capR, 3.0f);
    for (int i = 1; i < 4; ++i)
    {
        g.setColour (Colour (0x40ffffff));
        g.drawHorizontalLine ((int) (capR.getY() + capR.getHeight() * (float) i / 4.0f), capR.getX() + 3, capR.getRight() - 3);
    }
    g.setColour (Colours::white);
    g.fillRect (capR.getX() + 2, capR.getCentreY() - 1.0f, capR.getWidth() - 4, 2.0f);
}

// =====================================================================================
Knob::Knob (AudioProcessorValueTreeState& s, const String& id, const String& l, KnobStyle style,
            Colour lc, Colour cap)
    : label (l), labelColour (lc)
{
    slider.setSliderStyle (Slider::RotaryHorizontalVerticalDrag);
    slider.setTextBoxStyle (Slider::NoTextBox, false, 0, 0);
    slider.setRotaryParameters (MathConstants<float>::pi * 1.2f, MathConstants<float>::pi * 2.8f, true);
    slider.getProperties().set ("knob", (int) style);
    slider.getProperties().set ("cap", cap.toString());
    slider.getProperties().set ("tick", lc.toString());
    slider.setPopupDisplayEnabled (true, true, nullptr, 1200);
    slider.setMouseDragSensitivity (220);
    addAndMakeVisible (slider);
    att = std::make_unique<AudioProcessorValueTreeState::SliderAttachment> (s, id, slider);
    if (auto* p = s.getParameter (id))
        slider.setDoubleClickReturnValue (true, (double) p->convertFrom0to1 (p->convertTo0to1 (defaultFor (id))));
    slider.setTooltip (label);
}

void Knob::resized()
{
    auto r = getLocalBounds();
    r.removeFromBottom (14);
    slider.setBounds (r);
}

void Knob::paint (Graphics& g)
{
    g.setColour (labelColour);
    g.setFont (font (10.5f));
    g.drawFittedText (label.toUpperCase(), getLocalBounds().removeFromBottom (14), Justification::centred, 1);
}

Fader::Fader (AudioProcessorValueTreeState& s, const String& id, Colour lc) : labelColour (lc)
{
    slider.setSliderStyle (Slider::LinearVertical);
    slider.setTextBoxStyle (Slider::NoTextBox, false, 0, 0);
    slider.setPopupDisplayEnabled (true, true, nullptr, 1200);
    addAndMakeVisible (slider);
    att = std::make_unique<AudioProcessorValueTreeState::SliderAttachment> (s, id, slider);
    slider.setDoubleClickReturnValue (true, defaultFor (id));
}

void Fader::resized() { slider.setBounds (getLocalBounds().withTrimmedBottom (14).reduced (0, 10)); }

void Fader::paint (Graphics& g)
{
    g.setColour (labelColour);
    g.setFont (font (10.5f));
    g.drawFittedText ("FADER", getLocalBounds().removeFromBottom (14), Justification::centred, 1);
}

// =====================================================================================
ParamButton::ParamButton (AudioProcessorValueTreeState& s, const String& id, Kind k, String a, String b, Colour tc)
    : Button (id), kind (k), textA (a), textB (b), textColour (tc)
{
    setClickingTogglesState (true);
    att = std::make_unique<AudioProcessorValueTreeState::ButtonAttachment> (s, id, *this);
}

void ParamButton::paintButton (Graphics& g, bool over, bool down)
{
    auto r = getLocalBounds().toFloat();
    const bool on = getToggleState();

    if (kind == Foot)
    {
        auto c = r.getCentre();
        const float rad = jmin (r.getWidth(), r.getHeight()) * 0.5f - 2.0f;
        g.setColour (Colours::black.withAlpha (0.5f));
        g.fillEllipse (Rectangle<float> (rad * 2.1f, rad * 2.1f).withCentre (c.translated (1.5f, 3.0f)));
        // hex nut
        Path hex;
        for (int i = 0; i < 6; ++i)
        {
            const float a = MathConstants<float>::pi / 3.0f * (float) i;
            const Point<float> p (c.x + std::cos (a) * rad, c.y + std::sin (a) * rad);
            if (i == 0) hex.startNewSubPath (p); else hex.lineTo (p);
        }
        hex.closeSubPath();
        g.setGradientFill (ColourGradient (Colour (0xffd9d9d9), c.x - rad, c.y - rad, Colour (0xff5e5e5e), c.x + rad, c.y + rad, false));
        g.fillPath (hex);
        // plunger
        auto pl = Rectangle<float> (rad * 1.25f, rad * 1.25f).withCentre (c.translated (0.0f, down ? 1.0f : 0.0f));
        ColourGradient grad (Colour (0xfffafafa), pl.getX(), pl.getY(), Colour (0xff7a7a7a), pl.getRight(), pl.getBottom(), false);
        grad.addColour (0.45, over ? Colour (0xffe6e6e6) : Colour (0xffc4c4c4));
        g.setGradientFill (grad);
        g.fillEllipse (pl);
        g.setColour (Colour (0xff3a3a3a));
        g.drawEllipse (pl, 1.0f);
        return;
    }

    if (kind == Mini)
    {
        // bat toggle with A / B printed either side
        auto mid = r.withSizeKeepingCentre (16.0f, r.getHeight());
        g.setColour (textColour);
        g.setFont (font (10.0f));
        g.drawText (textA, r.withRight (mid.getX() - 2), Justification::centredRight);
        g.drawText (textB, r.withLeft (mid.getRight() + 2), Justification::centredLeft);
        auto nut = Rectangle<float> (14.0f, 14.0f).withCentre (mid.getCentre());
        g.setGradientFill (ColourGradient (Colour (0xffe0e0e0), nut.getX(), nut.getY(), Colour (0xff6a6a6a), nut.getRight(), nut.getBottom(), false));
        g.fillEllipse (nut);
        const float dir = on ? 1.0f : -1.0f;
        Line<float> bat (nut.getCentre(), nut.getCentre().translated (dir * 9.0f, -7.0f));
        g.setColour (Colours::black.withAlpha (0.4f));
        g.drawLine (bat.withShortenedStart (0.0f).toFloat(), 5.0f);
        g.setColour (Colour (0xffdedede));
        g.drawLine (bat, 3.5f);
        g.fillEllipse (Rectangle<float> (5.5f, 5.5f).withCentre (bat.getEnd()));
        return;
    }

    if (kind == Play)
    {
        auto key = r.reduced (1.0f).translated (0.0f, on ? 2.0f : 0.0f);
        g.setColour (Colours::black.withAlpha (0.6f));
        g.fillRoundedRectangle (r.translated (0, 3), 3.0f);
        g.setGradientFill (ColourGradient (on ? Colour (0xff8e8e8e) : Colour (0xffd0d0d0), key.getX(), key.getY(),
                                           on ? Colour (0xff5a5a5a) : Colour (0xff8a8a8a), key.getX(), key.getBottom(), false));
        g.fillRoundedRectangle (key, 3.0f);
        // play triangle
        Path tri;
        auto t = key.withSizeKeepingCentre (12.0f, 12.0f).translated (-14.0f, 0.0f);
        tri.addTriangle (t.getX(), t.getY(), t.getX(), t.getBottom(), t.getRight(), t.getCentreY());
        g.setColour (on ? Colour (0xff2fd36b) : kInk);
        g.fillPath (tri);
        g.setColour (kInk);
        g.setFont (font (11.0f));
        g.drawText (on ? "PLAY" : "STOP", key.withTrimmedLeft (22.0f), Justification::centred);
        return;
    }

    // Rocker (channel on)
    g.setColour (Colour (0xff1b1b1b));
    g.fillRoundedRectangle (r, 3.0f);
    auto half = on ? r.reduced (2.0f).removeFromRight (r.getWidth() * 0.5f) : r.reduced (2.0f).removeFromLeft (r.getWidth() * 0.5f);
    g.setColour (on ? Colour (0xffe8743b) : Colour (0xff5a5a5a));
    g.fillRoundedRectangle (half, 2.0f);
    g.setColour (on ? kInk : kCream);
    g.setFont (font (9.5f));
    g.drawText (on ? "ON" : "OFF", half, Justification::centred);
}

// =====================================================================================
Unit::Unit (MkgeeRigProcessor& p, Body b, Colour bc, Colour inkColour, String n, String s, String on)
    : proc (p), body (b), bodyColour (bc), ink (inkColour), name (n), sub (s), onParam (on)
{
    setOpaque (false);
}

Knob& Unit::knob (const String& id, const String& label, KnobStyle style, Rectangle<int> r, Colour cap)
{
    auto k = std::make_unique<Knob> (proc.apvts, id, label, style, ink, cap);
    auto& ref = *k;
    addAndMakeVisible (*k);
    k->setBounds (r);
    parts.emplace_back (std::move (k), r);
    return ref;
}

void Unit::fader (const String& id, Rectangle<int> r)
{
    auto f = std::make_unique<Fader> (proc.apvts, id, ink);
    addAndMakeVisible (*f);
    f->setBounds (r);
    parts.emplace_back (std::move (f), r);
}

void Unit::button (const String& id, ParamButton::Kind k, Rectangle<int> r, String a, String b)
{
    auto btn = std::make_unique<ParamButton> (proc.apvts, id, k, a, b, ink);
    addAndMakeVisible (*btn);
    btn->setBounds (r);
    parts.emplace_back (std::move (btn), r);
}

void Unit::resized()
{
    for (auto& [c, r] : parts)
        c->setBounds (r);
}

bool Unit::isOn() const
{
    if (onParam.isEmpty()) return true;
    if (auto* v = proc.apvts.getRawParameterValue (onParam))
        return v->load() > 0.5f;
    return true;
}

void Unit::tick()
{
    const bool on = isOn();
    if (on != lastOn) { lastOn = on; repaint(); }
}

void Unit::paintScrews (Graphics& g, Rectangle<float> r)
{
    for (auto p : { r.getTopLeft().translated (9, 9), r.getTopRight().translated (-9, 9),
                    r.getBottomLeft().translated (9, -9), r.getBottomRight().translated (-9, -9) })
    {
        auto s = Rectangle<float> (7.0f, 7.0f).withCentre (p);
        g.setGradientFill (ColourGradient (Colour (0xffd0d0d0), s.getX(), s.getY(), Colour (0xff555555), s.getRight(), s.getBottom(), false));
        g.fillEllipse (s);
        g.setColour (Colour (0xff3a3a3a));
        g.drawLine (s.getX() + 1.5f, s.getCentreY(), s.getRight() - 1.5f, s.getCentreY(), 1.0f);
    }
}

void Unit::paintLed (Graphics& g, Point<float> c, bool on, Colour col)
{
    if (on)
    {
        g.setGradientFill (ColourGradient (col.withAlpha (0.55f), c.x, c.y, col.withAlpha (0.0f), c.x + 14.0f, c.y, true));
        g.fillEllipse (Rectangle<float> (28.0f, 28.0f).withCentre (c));
    }
    auto led = Rectangle<float> (9.0f, 9.0f).withCentre (c);
    g.setColour (Colour (0xff222222));
    g.fillEllipse (led.expanded (1.5f));
    g.setGradientFill (ColourGradient (on ? col.brighter (0.6f) : col.darker (0.85f), led.getX() + 2, led.getY() + 2,
                                       on ? col : col.darker (0.95f), led.getRight(), led.getBottom(), true));
    g.fillEllipse (led);
}

void Unit::paint (Graphics& g)
{
    switch (body)
    {
        case Pedal: paintPedal (g); break;
        case Plate: paintPlate (g); break;
        case Strip: paintStrip (g); break;
        case Deck:  paintDeck (g); break;
    }
}

static void enclosure (Graphics& g, Rectangle<float> r, Colour c, float corner)
{
    g.setColour (Colours::black.withAlpha (0.55f));
    g.fillRoundedRectangle (r.translated (3.0f, 6.0f), corner);
    ColourGradient grad (c.brighter (0.18f), r.getX(), r.getY(), c.darker (0.28f), r.getX(), r.getBottom(), false);
    g.setGradientFill (grad);
    g.fillRoundedRectangle (r, corner);
    g.setColour (Colours::white.withAlpha (0.18f));
    g.drawRoundedRectangle (r.reduced (1.0f), corner, 1.2f);
    g.setColour (Colours::black.withAlpha (0.45f));
    g.drawRoundedRectangle (r, corner, 1.0f);
}

static void jack (Graphics& g, Point<float> c, bool leftSide)
{
    auto body = Rectangle<float> (10.0f, 18.0f).withCentre (c.translated (leftSide ? -4.0f : 4.0f, 0.0f));
    g.setColour (Colour (0xff202020));
    g.fillRoundedRectangle (body, 2.0f);
    g.setColour (Colour (0xff9a9a9a));
    g.fillEllipse (Rectangle<float> (7.0f, 7.0f).withCentre (body.getCentre()));
}

void Unit::paintPedal (Graphics& g)
{
    auto r = getLocalBounds().toFloat().reduced (2.0f, 0.0f).withTrimmedBottom (6.0f);
    enclosure (g, r, bodyColour, 10.0f);
    paintScrews (g, r);
    jack (g, { r.getX(), (float) jackY }, true);
    jack (g, { r.getRight(), (float) jackY }, false);

    paintLed (g, { r.getCentreX(), 15.0f }, isOn(), Colour (0xffff2a1a));

    // name block
    g.setColour (ink);
    g.setFont (font (26.0f));
    g.drawFittedText (name, Rectangle<int> (6, 188, getWidth() - 12, 30), Justification::centred, 1);
    g.setFont (font (10.0f, false));
    g.setColour (ink.withAlpha (0.8f));
    g.drawFittedText (sub, Rectangle<int> (6, 216, getWidth() - 12, 14), Justification::centred, 1);
    // stripe above footswitch
    g.setColour (ink.withAlpha (0.25f));
    g.drawHorizontalLine (234, r.getX() + 14, r.getRight() - 14);
}

void Unit::paintPlate (Graphics& g)
{
    auto r = getLocalBounds().toFloat().reduced (2.0f, 0.0f).withTrimmedBottom (6.0f);
    enclosure (g, r, bodyColour, 4.0f);
    // brushed lines
    Random rnd (7);
    for (int y = (int) r.getY() + 2; y < (int) r.getBottom() - 2; y += 2)
    {
        g.setColour (Colours::white.withAlpha (rnd.nextFloat() * 0.06f));
        g.drawHorizontalLine (y, r.getX() + 2, r.getRight() - 2);
    }
    paintScrews (g, r);
    g.setColour (ink);
    g.setFont (font (16.0f));
    g.drawFittedText (name, Rectangle<int> (4, 16, getWidth() - 8, 20), Justification::centred, 1);
    // big jack
    const bool isInput = name.containsIgnoreCase ("IN");
    auto jc = Point<float> (isInput ? r.getX() + 4.0f : r.getRight() - 4.0f, (float) jackY);
    jack (g, jc, isInput);
    auto socket = Rectangle<float> (26.0f, 26.0f).withCentre ({ r.getCentreX(), (float) jackY });
    g.setGradientFill (ColourGradient (Colour (0xffeeeeee), socket.getX(), socket.getY(), Colour (0xff6a6a6a), socket.getRight(), socket.getBottom(), false));
    g.fillEllipse (socket);
    g.setColour (Colour (0xff0e0e0e));
    g.fillEllipse (socket.reduced (7.0f));
    g.setColour (ink.withAlpha (0.8f));
    g.setFont (font (9.0f, false));
    g.drawFittedText (sub, Rectangle<int> (4, jackY + 16, getWidth() - 8, 12), Justification::centred, 1);
}

void Unit::paintStrip (Graphics& g)
{
    auto r = getLocalBounds().toFloat().reduced (2.0f, 0.0f).withTrimmedBottom (6.0f);
    enclosure (g, r, bodyColour, 5.0f);
    jack (g, { r.getX(), (float) jackY }, true);
    jack (g, { r.getRight(), (float) jackY }, false);
    // section lines like a mixer channel
    g.setColour (ink.withAlpha (0.35f));
    for (int y : { 90, 158, 226 })
        g.drawHorizontalLine (y, r.getX() + 6, 70.0f);
    g.drawVerticalLine (72, r.getY() + 8, r.getBottom() - 8);
    // channel number + peak led
    g.setColour (ink);
    g.setFont (font (12.0f));
    g.drawText ("1", Rectangle<int> (10, 4, 20, 14), Justification::centredLeft);
    paintLed (g, { 64.0f, 30.0f }, peak, Colour (0xffff2a1a));
    g.setFont (font (7.5f));
    g.drawText ("PEAK", Rectangle<int> (52, 38, 24, 10), Justification::centred);
    // name printed vertically down the fader side
    g.setFont (font (11.0f));
    g.setColour (ink.withAlpha (0.85f));
    g.drawFittedText (name, Rectangle<int> (76, 4, getWidth() - 82, 14), Justification::centred, 1);
}

void Unit::paintDeck (Graphics& g)
{
    auto r = getLocalBounds().toFloat().reduced (2.0f, 0.0f).withTrimmedBottom (6.0f);
    enclosure (g, r, bodyColour, 6.0f);
    paintScrews (g, r);
    jack (g, { r.getX(), (float) jackY }, true);
    jack (g, { r.getRight(), (float) jackY }, false);

    // cassette window
    auto win = Rectangle<float> (18.0f, 20.0f, r.getWidth() - 32.0f, 104.0f);
    g.setColour (Colour (0xff050505));
    g.fillRoundedRectangle (win, 5.0f);
    auto shell = win.reduced (8.0f, 7.0f);
    g.setColour (Colour (0xff2a2622));
    g.fillRoundedRectangle (shell, 4.0f);
    // label
    auto label = shell.reduced (8.0f, 6.0f).withHeight (24.0f);
    g.setColour (Colour (0xffefe6cf));
    g.fillRoundedRectangle (label, 2.0f);
    g.setColour (Colour (0xffd2452b));
    g.fillRect (label.withTrimmedTop (label.getHeight() - 5.0f));
    g.setColour (kInk);
    g.setFont (font (11.0f));
    g.drawText (name, label.withTrimmedBottom (5.0f).withTrimmedLeft (6.0f), Justification::centredLeft);
    g.setFont (font (9.0f, false));
    g.drawText (sub, label.withTrimmedBottom (5.0f).withTrimmedRight (6.0f), Justification::centredRight);
    // tape window + reels
    auto tapeWin = Rectangle<float> (shell.getCentreX() - 70.0f, shell.getY() + 38.0f, 140.0f, 46.0f);
    g.setColour (Colour (0xff15110e));
    g.fillRoundedRectangle (tapeWin, 10.0f);
    for (int i = 0; i < 2; ++i)
    {
        auto c = Point<float> (tapeWin.getCentreX() + (i == 0 ? -42.0f : 42.0f), tapeWin.getCentreY());
        const float tapeR = i == 0 ? 21.0f : 15.0f;
        g.setColour (Colour (0xff3b2a1c));
        g.fillEllipse (Rectangle<float> (tapeR * 2, tapeR * 2).withCentre (c));
        auto hub = Rectangle<float> (16.0f, 16.0f).withCentre (c);
        g.setColour (Colour (0xffe8e2d4));
        g.fillEllipse (hub);
        g.setColour (Colour (0xff15110e));
        for (int k = 0; k < 6; ++k)
        {
            const float a = reelAngle + MathConstants<float>::twoPi * (float) k / 6.0f;
            g.fillEllipse (Rectangle<float> (3.0f, 3.0f).withCentre (c.translated (std::sin (a) * 5.5f, -std::cos (a) * 5.5f)));
        }
    }
    g.setColour (Colour (0x22ffffff));
    g.fillRoundedRectangle (win.withHeight (win.getHeight() * 0.4f).reduced (4.0f, 3.0f), 4.0f);
}

// =====================================================================================
Board::Board (MkgeeRigProcessor& p) : proc (p)
{
    const int top = 52, h = 300;
    int x = 16;
    auto add = [&] (Unit* u, int w) { units.add (u); addAndMakeVisible (u); u->setBounds (x, top, w, h); x += w + 14; return u; };

    // ---- GUITAR IN
    {
        auto* u = add (new Unit (p, Unit::Plate, Colour (0xff8e9196), kInk, "GUITAR IN", "single coil", {}), 100);
        u->knob ("gtr_gain", "Input", Chrome, { 21, 118, 56, 70 });
        u->knob ("gtr_tone", "Pickup", Chrome, { 21, 198, 56, 70 });
    }
    // ---- DROP
    {
        auto* u = add (new Unit (p, Unit::Pedal, Colour (0xffa3202a), kCream, "DROP", "polyphonic pitch drop", "drop_on"), 150);
        u->knob ("drop_semi", "Semis", Chicken, { 37, 26, 76, 90 });
        u->knob ("drop_mix", "Blend", Cream, { 6, 118, 46, 62 });
        u->knob ("drop_glide", "Glide", Cream, { 52, 118, 46, 62 });
        u->knob ("drop_grain", "Grain", Cream, { 98, 118, 46, 62 });
        u->button ("drop_on", ParamButton::Foot, { 51, 238, 48, 48 });
    }
    // ---- VIBE
    {
        auto* u = add (new Unit (p, Unit::Pedal, Colour (0xff86abc8), Colour (0xff10223a), "VIBE", "bbd chorus / vibrato", "vibe_on"), 150);
        u->knob ("vibe_rate", "Rate", BlackSkirt, { 10, 28, 62, 76 });
        u->knob ("vibe_depth", "Depth", BlackSkirt, { 78, 28, 62, 76 });
        u->knob ("vibe_tone", "BBD", BlackSkirt, { 10, 108, 54, 66 });
        u->button ("vibe_mode", ParamButton::Mini, { 66, 126, 80, 30 }, "CHO", "VIB");
        u->button ("vibe_on", ParamButton::Foot, { 51, 238, 48, 48 });
    }
    // ---- PARA EQ
    {
        auto* u = add (new Unit (p, Unit::Pedal, Colour (0xffe9e3d3), kInk, "PARA EQ", "parametric equaliser", "eq_on"), 200);
        const char* ids[] = { "eq_lofreq", "eq_logain", "eq_midfreq", "eq_midgain", "eq_hifreq", "eq_higain", "eq_lowcut", "eq_midq" };
        const char* labels[] = { "Lo Freq", "Lo Gain", "Mid Freq", "Mid Gain", "Hi Freq", "Hi Gain", "Low Cut", "Mid Q" };
        for (int i = 0; i < 8; ++i)
            u->knob (ids[i], labels[i], BlackSkirt, { 8 + (i / 2) * 46, 30 + (i % 2) * 74, 46, 64 });
        u->button ("eq_on", ParamButton::Foot, { 76, 238, 48, 48 });
    }
    // ---- FUZZ VERB
    {
        auto* u = add (new Unit (p, Unit::Pedal, Colour (0xff1f5e57), Colour (0xfff09a4a), "FUZZ VERB", "reverb with fuzz inside", "verb_on"), 170);
        u->knob ("verb_decay", "Decay", Cream, { 4, 28, 54, 66 });
        u->knob ("verb_size", "Size", Cream, { 58, 28, 54, 66 });
        u->knob ("verb_tone", "Tone", Cream, { 112, 28, 54, 66 });
        u->knob ("verb_fuzz", "Fuzz", Cream, { 30, 96, 54, 66 });
        u->knob ("verb_mix", "Mix", Cream, { 86, 96, 54, 66 });
        u->button ("verb_pos", ParamButton::Mini, { 35, 162, 100, 24 }, "PRE", "POST");
        u->button ("verb_on", ParamButton::Foot, { 61, 238, 48, 48 });
    }
    // ---- ECHO
    {
        auto* u = add (new Unit (p, Unit::Pedal, Colour (0xff5d636c), Colour (0xfff2f2f2), "ECHO", "digital delay w/ tape wobble", "echo_on"), 170);
        u->knob ("echo_time", "Time", BlackSkirt, { 4, 28, 54, 66 });
        u->knob ("echo_fb", "Repeats", BlackSkirt, { 58, 28, 54, 66 });
        u->knob ("echo_tone", "Tone", BlackSkirt, { 112, 28, 54, 66 });
        u->knob ("echo_wob", "Wobble", BlackSkirt, { 4, 96, 54, 66 });
        u->knob ("echo_pp", "Ping Pong", BlackSkirt, { 58, 96, 54, 66 });
        u->knob ("echo_mix", "Mix", BlackSkirt, { 112, 96, 54, 66 });
        u->button ("echo_pos", ParamButton::Mini, { 35, 162, 100, 24 }, "PRE", "POST");
        u->button ("echo_on", ParamButton::Foot, { 61, 238, 48, 48 });
    }
    // ---- 4-TRACK CHANNEL STRIP
    {
        strip = add (new Unit (p, Unit::Strip, Colour (0xffc4c1b8), kInk, "4-TRACK", "", "pre_on"), 150);
        strip->knob ("pre_trim", "Trim", Mixer, { 8, 22, 58, 68 }, Colour (0xffc8372d));
        strip->knob ("pre_treble", "Treble", Mixer, { 8, 92, 58, 66 }, Colour (0xff8a8a8a));
        strip->knob ("pre_mid", "Mid", Mixer, { 8, 160, 58, 66 }, Colour (0xff8a8a8a));
        strip->knob ("pre_bass", "Bass", Mixer, { 8, 228, 58, 66 }, Colour (0xff8a8a8a));
        strip->button ("pre_on", ParamButton::Rocker, { 86, 22, 50, 18 });
        strip->fader ("pre_fader", { 82, 44, 58, 186 });
        strip->knob ("pre_level", "Level", Mixer, { 82, 232, 58, 62 }, Colour (0xffe9e3d3));
    }
    // ---- CASSETTE
    {
        deck = add (new Unit (p, Unit::Deck, Colour (0xff1c1c1e), Colour (0xffd9d4c7), "CASSETTE", "C-60  TYPE I", "tape_on"), 260);
        deck->button ("tape_on", ParamButton::Play, { 85, 130, 90, 22 });
        const char* ids[] = { "tape_wow", "tape_flutter", "tape_sat", "tape_hiss", "tape_age", "tape_drop" };
        const char* labels[] = { "Wow", "Flutter", "Sat", "Hiss", "Age", "Dropout" };
        for (int i = 0; i < 6; ++i)
            deck->knob (ids[i], labels[i], Chrome, { 22 + (i % 3) * 74, 160 + (i / 3) * 68, 64, 66 });
    }
    // ---- OUT
    {
        auto* u = add (new Unit (p, Unit::Plate, Colour (0xff8e9196), kInk, "OUT", "to amp / daw", {}), 110);
        u->knob ("out_mix", "Dry/Wet", Chrome, { 25, 96, 60, 66 });
        u->knob ("out_width", "Width", Chrome, { 25, 162, 60, 66 });
        u->knob ("out_gain", "Output", Chrome, { 25, 228, 60, 66 });
    }
}

void Board::resized() {}

void Board::paint (Graphics& g)
{
    // floor / board
    g.setGradientFill (ColourGradient (Colour (0xff2b2724), 0, 0, Colour (0xff141210), 0, (float) H, false));
    g.fillAll();
    Random rnd (3);
    for (int i = 0; i < 1400; ++i)
    {
        g.setColour (Colours::white.withAlpha (rnd.nextFloat() * 0.035f));
        g.fillRect ((float) rnd.nextInt (W), (float) rnd.nextInt (H), 1.5f, 1.5f);
    }
    // header
    g.setColour (kCream);
    g.setFont (font (22.0f));
    g.drawText ("MKGEE RIG", 18, 10, 260, 30, Justification::centredLeft);
    g.setFont (font (11.0f, false));
    g.setColour (kCream.withAlpha (0.6f));
    g.drawText ("guitar  >  drop  >  vibe  >  para eq  >  fuzz verb  >  echo  >  4-track preamp  >  cassette  >  out",
                200, 14, W - 400, 22, Justification::centred);
    g.setColour (Colour (0xffe8743b));
    g.setFont (font (11.0f));
    g.drawText ("KALABASH", W - 200, 14, 182, 22, Justification::centredRight);
}

void Board::paintOverChildren (Graphics& g)
{
    // patch cables between jacks
    for (int i = 0; i + 1 < units.size(); ++i)
    {
        auto a = units[i]->getBounds();
        auto b = units[i + 1]->getBounds();
        const float y1 = (float) (a.getY() + units[i]->jackY);
        const float y2 = (float) (b.getY() + units[i + 1]->jackY);
        Point<float> p1 ((float) a.getRight() + 2.0f, y1), p2 ((float) b.getX() - 2.0f, y2);
        Path cable;
        cable.startNewSubPath (p1);
        cable.cubicTo (p1.translated (22.0f, 70.0f), p2.translated (-22.0f, 70.0f), p2);
        g.setColour (Colours::black.withAlpha (0.4f));
        g.strokePath (cable, PathStrokeType (6.5f), AffineTransform::translation (2.0f, 4.0f));
        g.setColour (Colour (0xff161616));
        g.strokePath (cable, PathStrokeType (5.5f));
        g.setColour (Colour (0xff4a4a4a));
        g.strokePath (cable, PathStrokeType (1.4f), AffineTransform::translation (-0.8f, -1.2f));
        // plugs
        for (auto [pt, dir] : { std::pair<Point<float>, float> { p1, 1.0f }, { p2, -1.0f } })
        {
            auto barrel = Rectangle<float> (9.0f, 10.0f).withCentre (pt.translated (dir * 4.0f, 0.0f));
            g.setGradientFill (ColourGradient (Colour (0xffe0e0e0), barrel.getX(), barrel.getY(), Colour (0xff6a6a6a), barrel.getX(), barrel.getBottom(), false));
            g.fillRoundedRectangle (barrel, 2.0f);
        }
    }
}

void Board::tick()
{
    for (auto* u : units)
        u->tick();

    if (strip != nullptr)
    {
        const float trimDb = proc.apvts.getRawParameterValue ("pre_trim")->load();
        const bool pk = proc.inPeak.load() * Decibels::decibelsToGain (trimDb) > 1.6f
                        && proc.apvts.getRawParameterValue ("pre_on")->load() > 0.5f;
        if (pk != strip->peak) { strip->peak = pk; strip->repaint (40, 16, 40, 40); }
    }

    if (deck != nullptr && proc.apvts.getRawParameterValue ("tape_on")->load() > 0.5f)
    {
        const float wow = proc.apvts.getRawParameterValue ("tape_wow")->load();
        deck->reelAngle += 0.09f * (1.0f + wow * 0.35f * std::sin ((float) Time::getMillisecondCounter() * 0.0034f));
        deck->repaint (16, 18, deck->getWidth() - 30, 108);
    }
}
} // namespace ui

// =====================================================================================
MkgeeRigEditor::MkgeeRigEditor (MkgeeRigProcessor& p)
    : AudioProcessorEditor (&p), board (p)
{
    setLookAndFeel (&lnf);
    addAndMakeVisible (board);
    board.setBounds (0, 0, ui::Board::W, ui::Board::H);

    setResizable (true, true);
    const double ratio = (double) ui::Board::W / (double) ui::Board::H;
    getConstrainer()->setFixedAspectRatio (ratio);
    setResizeLimits ((int) (ui::Board::W * 0.55), (int) (ui::Board::H * 0.55),
                     (int) (ui::Board::W * 1.6), (int) (ui::Board::H * 1.6));
    setSize ((int) (ui::Board::W * 0.85), (int) (ui::Board::H * 0.85));
    startTimerHz (30);
}

MkgeeRigEditor::~MkgeeRigEditor()
{
    stopTimer();
    setLookAndFeel (nullptr);
}

void MkgeeRigEditor::resized()
{
    const float scale = (float) getWidth() / (float) ui::Board::W;
    board.setTransform (AffineTransform::scale (scale));
}
