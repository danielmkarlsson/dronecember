(
Pdef(0,
    Pseed(9,
        Pbind(*[
            type: \cln,
            snd: Prand([\ixa, \saw, \sqr, \sin], inf),
            wid: Phprand(0.01, 0.5),
            dur: Pmeanrand(1/15, 1/5),
            legato: 149,
            mul: Pdup(Phprand(19, 39), Pxrand([1, 2, 4, 8], inf)),
            freq: Pdup(Phprand(29, 79), Pwrand2([
                [100, 112.5, 125, 150, 175.0, 187.5, 200],
                [100, 112.5, 125, 150, 175.0, 187.5],
                [100, 112.5, 125, 150, 175.0],
                [100, 112.5, 125, 150],
                [100, 112.5, 125],
                [100, 112.5],
                [100],
            ], [1, 5, 9, 14, 19, 24, 29], inf)) * Pkey(\mul),
            pan: Pmeanrand(0.0, 1.0),
            amp: (Pdup(Phprand(1, 11), Pmeanrand(0.125, 0.375)) 
            / Pkey(\mul).linlin(1, 8, 0.75, 1.25)).trace,
            atk: Plprand(1.1, 10.1),
            hld: Plprand(1.0, 5.0),
            hld: Plprand(1.5, 15.0),
            crv: Pdup(Plprand(1, 7), Phprand(-8.0, 8.0)),
            cav: 1,
            cai: Pdup(Phprand(19, 59), Pwhite(0.0, 1.0)),
        ])
    )
).play
)

s.record

Pdef(0).stop

