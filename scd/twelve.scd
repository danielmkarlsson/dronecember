(
Pdef(0,
    Pseed(11,
        Pbind(*[
            type: Prand([\cln, \], inf),
            snd: \kps,
            dur: Plprand(1/17, 1/7),
            pan: Plprand(0.1, 0.5),
            harmonic: Pdup(Plprand(99, 299), Plprand(1, 5)),
            octave: Pdup(Plprand(99, 299), Plprand(2, 7)),
            degree: Pdup(Plprand(99, 299), Prand([-4, -2, 0, 2], inf)),
            lpf: Pseg([2000, 200, 20000], Plprand(30.0, 90.0), \exp, inf),
            amp: Pseg([0.25, 0.5, 0.25], Plprand(30.0, 90.0), \wel, inf) 
                / Pkey(\lpf).expexp(20, 20000, 0.25, 4),
            lhf: Pseg([0.5, 0.25, 0.5], Plprand(30.0, 90.0), \wel, inf),
            ocd: Pseg([0.0, 0.5, 0.0], Plprand(30.0, 90.0), \wel, inf),
            ocu: Pseg([1.0, 0.0, 1.0], Plprand(30.0, 90.0), \wel, inf),
            tri: Pseg([0.0, 1.0, 0.0], Plprand(30.0, 90.0), \wel, inf),
            atk: Plprand(1.5, 4.5),
            rel: Plprand(33.0, 99.0),
            crv: 8,
            legato: 99,
            cav: 8,
        ])
    )
).play;
Pdef(1,
    Pseed(19, 
        Pbind(*[
            type: Prand([\cln, \], inf),
            snd: \kps,
            dur: Plprand(1/17, 1/7),
            pan: Phprand(0.5, 0.9),
            harmonic: Pdup(Plprand(99, 299), Plprand(1, 5)),
            octave: Pdup(Plprand(99, 299), Plprand(2, 7)),
            degree: Pdup(Plprand(99, 299), Prand([-4, -2, 0, 2], inf)),
            lpf: Pseg([2000, 200, 20000], Plprand(30.0, 90.0), \exp, inf),
            amp: Pseg([0.25, 0.5, 0.25], Plprand(30.0, 90.0), \wel, inf) 
                / Pkey(\lpf).expexp(20, 20000, 0.25, 4).trace,
            lhf: Pseg([0.5, 0.25, 0.5], Plprand(30.0, 90.0), \wel, inf),
            ocd: Pseg([0.0, 0.5, 0.0], Plprand(30.0, 90.0), \wel, inf),
            ocu: Pseg([1.0, 0.0, 1.0], Plprand(30.0, 90.0), \wel, inf),
            tri: Pseg([0.0, 1.0, 0.0], Plprand(30.0, 90.0), \wel, inf),
            atk: Plprand(1.5, 4.5),
            rel: Plprand(33.0, 99.0),
            crv: 8,
            legato: 99,
            cav: 8,
        ])
    )
).play
)
