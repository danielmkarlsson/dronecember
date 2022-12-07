(
Pdef(0,
    Pseed(2,
        Pbind(*[
            type: \cln,
            snd: Pwrand2([\ixa, \saw, \sin, \], [1, 2, 8, 4], inf),
            dur: 1 / Pwhite(0.1, 7.7),
            wid: Phprand(0.0, 0.5),
            pan: Pwhite(0.0, 1.0),
            atk: Plprand(9.0, 19.0),
            rel: Plprand(9.0, 19.0),
            crv: Pmeanrand(-8.0, 8.0).trace,
            legato: 999,
            div: Pdup(19, Pwrand2([1/2, 2/3, 1, 1 + 2/3, 2, 4], [3, 4, 5, 1, 2, 1], inf)),
            freq: Pwrand2([
                200, 
                [200, 240], 
                [200, 240, 320], 
                [240, 320]
            ], [4, 3, 2, 1], inf) / Pkey(\div),
            lpf: Pkey(\freq) * Plprand(0.5, 2.0),
            bes: 1/5,
            abs: 1/5,
            ths: 1/5,
            cav: 1,
            cai: Pseg(Pwhite(0.0, 1.0), Plprand(30.0, 90.0), \sin, inf),
            amp: Pseg(Plprand(0.25, 0.75), Plprand(30.0, 90.0), \wel, inf) 
                / Pkey(\div).linlin(0.5, 4.0, 1, 2),
            ocd: Pseg(Pwhite(0.0, 1.0), Plprand(30.0, 90.0), \wel, inf),
            ocu: Pseg(Pwhite(0.0, 1.0), Plprand(30.0, 90.0), \wel, inf),
        ])
    )
).play
)
