~clean.lsf("~/snd/rng")
(
Pdef(0,
    Pseed(17,
        Pbind(*[
            type: \cln,
            snd: \rng,
            dur: 1,
            num: Pxshuf((0 .. 3), inf),
            legato: 99999,
            pan: Pmeanrand(0.0, 1.0),
            bgn: Plprand(0.0, 0.5).trace,
            atk: Plprand(1.25, 5.0),
            hld: Plprand(1.25, 50.0),
            rel: Plprand(1.25, 500.0),
            spd: Pdup(Pwrand2(
                [4, 8, 16, 32, 64], 
                [16, 8, 4, 2, 1], 
                inf), Plprand(0.4, 4.4).round(0.4)),
            amp: Plprand(0.1, 0.2) 
                / Pkey(\spd).linlin(0.4, 4.0, 1.0, 3.0),
            cav: 1,
        ])
    )
).play
)
