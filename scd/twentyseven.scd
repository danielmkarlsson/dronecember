~clean.lsf("~/snd/vnl")
(
Pdef(0,
    Pseed(0,
        Pbind(*[
            type: \cln,
            snd: \vnl,
            dup: Plprand(15, 25),
            dur: Pdup(Pkey(\dup), Plprand(2.5, 5.0)),        
            bgn: Pdup(Pkey(\dup), Pwhite(0.0, 1.0)),
            lpf: Pdup(Pkey(\dup), Plprand(80, 800)).round(40),
            amp: (Pseg([0.0, 1.0, 0.0], Plprand(15.0, 45.0), \sin, inf) / Pkey(\lpf).linlin(80, 800, 1, 3)),
            lpq: Pdup(Pkey(\dup), Plprand(0.25, 1.0)),
            pan: Pdup(Pkey(\dup), Pmeanrand(0.0, 1.0)),
            legato: 99,
            cav: 1,
            cai: Pkey(\lpq),
        ])
    )
).play;
Pdef(1,
    Pseed(1,
        Pbind(*[
            type: \cln,
            snd: \dfd,
            dup: Plprand(15, 25),
            dur: Pdup(Pkey(\dup) / 2, Plprand(1/3, 3.0)) / 3.5,        
            freq: Pdup(Pkey(\dup), Plprand(40, 400)).round(20),
            amp: (Pseg([0.0, 0.3, 0.0], Plprand(5.0, 15.0), \sin, inf) / Pkey(\freq).linlin(80, 800, 1, 2)),
            res: 0.999,
            cav: 2,
            legato: 99,
            atk: 1,
            rel: 9,
            aux: 1,
            brf: Pmeanrand(150, 300),
            brn: Plprand(0.0, 1.0),
            bro: Plprand(0.0, 1.0),
        ])
    )
).play;
Pdef(2,
    Pseed(1,
        Pbind(*[
            type: \cln,
            snd: \sin,
            dup: Plprand(15, 25),
            freq: Pdup(Pkey(\dup), Plprand(20, 1000)).round(20),
            dur: Pdup(Pkey(\dup), Plprand(1.0, 3.0)) / 5,        
            amp: (Pseg([0.6, 0.0, 0.6], Plprand(15.0, 45.0), \sin, inf)) / Pkey(\freq).linlin(20, 1000, 0.8, 4.0), 
            pan: Pdup(Pkey(\dup), Pmeanrand(0.0, 1.0)).trace,
            legato: 199,
            atk: 1.0,
            rel: 99,
            aux: 2,
        ])
    )
).play;
)
