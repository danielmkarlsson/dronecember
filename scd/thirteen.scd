~clean.lsf("~/snd/bwm") // spd: 1.505,
~clean.lsf("~/snd/orb") // spd: 1.0,
~clean.lsf("~/snd/ocv") // spd: 1.346,
(
Pdef(0,
    Pseed(9,
        Pbind(*[
            type: Pseq([\cln, Pwrand2([\cln, \], [10, 1], inf)], inf),
            snd: Pseq([\bwm, \orb, \ocv, \add], inf),
            bgn: Plprand(0.0, 0.875).trace,
            dur: Plprand(0.6, 6.0),
            spd: Pseq([
                Prand([1.505, 3.01], 1),
                Prand([1.0, 2.0], 1), 
                Prand([0.673, 0.3365], inf), 
                1.0,
                ], inf),
            octave: Plprand(3, 4),
            atk: Plprand(9.0, 19.0),
            hld: Plprand(9.0, 19.0),
            rel: Plprand(9.0, 19.0),
            crv: 0.0,
            legato: 99,
            scale: Scale.harmonicMinor(\just),
            degree: Pdup(Plprand(9, 19), Plprand(0, 7)),
            mtranspose: Pdup(Plprand(9, 19), Plprand(0, 4)),
            harmonic: Pdup(Plprand(9, 19), Plprand(1, 4)),
            amp: Pseq([0.7, 0.25, 0.15, 0.15], inf),
            cav: 1/4,
        ])
    )
).play;
)
