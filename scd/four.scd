(
~scl = Pseed(98, Pdup(Plprand(29, 59), Prand([
    Scale.major(\sept2), Scale.minor(\sept2), Scale.mixolydian(\sept2), Scale.pelog(\sept2),
    Scale.aeolian(\sept2), Scale.ionian(\sept2), Scale.harmonicMinor(\sept2), Scale.whole(\sept2),
    Scale.phrygian(\sept2), Scale.melodicMinor(\sept2), Scale.harmonicMinor(\sept2), Scale.hexMajor7(\sept2),
    Scale.augmented(\sept2), Scale.bartok(\sept2), Scale.diminished(\sept2), Scale.hexDorian(\sept2),
], inf))).asStream;
~pat = {|seed, degree, pan, aux, dur|
    var dfl =
    Pbind(*[
        type: Pseq([\cln, \], inf),
        snd: \fmx,
        scale: Pfunc({~scl.next}),
        octave: Pmeanrand(3, 6).round,
        amp: (Plprand(0.3, 0.5) / Pkey(\octave).linlin(3, 6, 1.0, 1.5)).trace,
        atk: 6.0,
        rel: 1,
        legato: 9,
        sustain: 9,
        cav: 16,
        degree: degree,
        pan: pan,
        aux: aux,
        dur: dur,
    ]);
    Pseed(seed, Pseq([dfl], inf));
};
Pdef(0, ~pat.(2, Pshuf([0, 2, 4, 7], inf), 0, 0, 8.0)).play;
Pdef(1, ~pat.(3, Pshuf([0, 2, 4, 6], inf), 1, 1, Pseg([8.0, 8.0065, 8.0], [6480, 3240], \lin, inf))).play;
Pdef(2, ~pat.(6, Pshuf([0, 2, 4, 5], inf), 0.5, 2, Pseg([8.0, 8.0075, 8.0], [6480, 3240], \lin, inf))).play;
Pdef(3, ~pat.(9, Pshuf([0, 2, 4, 3], inf), 0.25, 3, Pseg([8.0, 8.0085, 8.0], [6480, 3240], \lin, inf))).play;
Pdef(4, ~pat.(12, Pshuf([0, 2, 4, 1], inf), 0.75, 4, Pseg([8.0, 8.0095, 8.0], [6480, 3240], \lin, inf))).play;
)
