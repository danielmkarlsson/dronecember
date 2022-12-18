~clean.lsf("~/snd/ocs") // spd: 1.231,
~clean.lsf("~/snd/ocv") // spd: 1.346,
(
Pdef(0,
    Pseed(99,
        Pbind(*[
            type: \cln,
            snd: Pseq([\ocs, \ocv], inf),
            spd: Pseq([1.346, 1.231], inf),
            num: Pxshuf((0 .. 3), inf),
            dur: Plprand(1.0, 9.0),
            legato: 99,
            rel: 99,
            crv: 16,
            scale: Scale.chromatic(\mean4),
            degree: Plprand(0, 7),
            octave: Pmeanrand(1, 4).round,
            pan: Pmeanrand(0.0, 1.0),
            amp: Pseq([
                Pmeanrand(-21.0, -15.0, 1), 
                Pmeanrand(-9.0, -3.0, 1)
            ], inf).dbamp.trace,
            lpf: Plprand(20, 20000),
            lhf: Plprand(0.0, 0.5),
            cav: 1.0,
            cai: Pseg(Pwhite(0.0, 1.0), Plprand(30.0, 90.0), \lin, inf),
        ])
    )
).play
)
