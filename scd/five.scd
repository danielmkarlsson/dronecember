~clean.lsf("~/snd/rec")
(
Pdef(0,
    Pseed(2,
        Pbind(*[
            type: \cln,
            snd: Pwrand2([\rec, \dfd], [4, 1], inf),
            dur: 8,
            num: 4,
            legato: 99,
            spd: 1.015,
            pan: Pmeanrand(0.0, 0.5),
            degree: Plprand(0, 7),
            octave: Plprand(2, 5),
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            bgn: Plprand(0.0, 0.05),
            amp: Plprand(1.0, 2.0) * Pkey(\acp).trace,
            atk: Phprand(3.5, 7.0),
            hld: Phprand(13.5, 19.0),
            rel: Phprand(3.5, 7.0),
            lhf: Pmeanrand(0.0, 1.0),
            ocd: Pkey(\octave).linlin(3.0, 5.0, 0.0, 0.5),
            ocq: Pkey(\octave).linlin(3.0, 5.0, 0.0, 0.125),
            ocu: Pkey(\octave).linlin(3.0, 5.0, 0.125, 0.0),
            tri: Pkey(\octave).linlin(2.0, 4.0, 0.125, 0.0),
            scale: Scale.mixolydian(\just),
        ])
    )
).play
)
