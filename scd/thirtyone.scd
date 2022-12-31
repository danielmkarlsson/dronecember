~clean.lsf("~/snd/clh")
~clean.lsf("~/snd/orb")
(
Pdef(0,
    Pseed(9,
        Pbind(*[
            type: Pwrand2([\cln, \], [1, 2], inf),
            snd: Pseed(0, Prand([\clh, \sin, \orb], inf)),
            bgn: (Pwhite(0.0, 0.05) + Pseg([0.0, 0.9, 0.0], 90, \lin, inf)), 
            dur: 1/9,
            num: Pwhite(0, 2),
            spd: Pseed(0, Prand([1.403, 1, 1], inf)),
            pan: Pmeanrand(0.1, 0.9),
            octave: Pwhite(1, 4) + Pseed(0, Prand([2, -1, 1], inf)),
            degree: Pwrand2([0, 4], [3, 1], inf),
            mtranspose: -4,
            amp: Pseg(Pwhite(1/6, 1/4), Pwhite(15.0, 90.0), \wel, inf) 
            * Pseed(0, Prand([1/3, 1, 1], inf)) / Pkey(\num).linlin(0, 2, 1, 3),
            atk: Phprand(9.0, 19.0).trace,
            rel: 19,
            crv: 0,
            stretch: Pseg(Pwhite(0.5, 1.5), Pwhite(15.0, 90.0), \lin, inf),
            legato: Pseg(Plprand(299.0, 399.0), Pwhite(15.0, 90.0), \lin, inf),
            cav: 1,
            cai: Pseg(Pwhite(0.0, 1.0), Pwhite(15.0, 90.0), \lin, inf),
        ])
    )
).play
)

