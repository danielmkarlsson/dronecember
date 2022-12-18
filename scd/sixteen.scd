~clean.lsf("~/snd/orb")
(
Pdef(0,
    Pseed(7,
        Pbind(*[
            type: \cln,
            snd: \orb,
            dur: Plprand(1.0, 9.0),
            degree: Pdup(Plprand(1, 19), Pwrand2(
                [0, 1, 2, 3, 4, 5, 6, 7], 
                [4, 1, 2, 1, 3, 2, 3], inf)),
                octave: Plprand(1, 6),
                mtranspose: Pdup(Plprand(1, 29), Plprand(0, 7)),
                scale: Pdup(Plprand(1, 29), Pxshuf([
                    Scale.harmonicMinor(\sept2),
                    Scale.pelog(\just),
                    Scale.ionian(\sept2),
                    Scale.aeolian(\just),
                    Scale.mixolydian(\sept2),
                ], inf)),
                legato: 99,
                atk: Plprand(2.0, 8.0),
                hld: Plprand(1.0, 6.0),
                rel: Plprand(2.0, 4.0),
                amp: Plprand(0.5, 1.0),
                cav: 1/8,
                lpf: Pkey(\octave).linexp(1, 5, 20000, 200),
                bgn: Plprand(0.01, 0.2).trace,
                pan: Pmeanrand(0.1, 0.9),
            ])
        )
    ).play
)
