~clean.lsf("~/snd/clh")
(
Pdef(0,
    Pseed(12, 
        Pbind(*[
            type: Pseq([\cln, Pwrand2([\cln, \], [1, 2], inf)], inf),
            snd: \clh,
            dur: Plprand(1.0, 3.0).trace,
            num: Pwhite(0, 1),
            bgn: Plprand(0.0, 0.5),
            legato: 199,
            pan: Pseq([
                Pmeanrand(0.25, 0.75, 1), 
                Plprand(0.0, 0.5, 1), 
                Pmeanrand(0.25, 0.75, 1), 
                Phprand(0.5, 1.0, 1)
            ], inf),
            atk: Pmeanrand(1.0, 10.0),
            hld: Pmeanrand(1.0, 10.0),
            rel: Pmeanrand(1.0, 10.0),
            scale: Scale.pelog(\just),
            degree: Pdup(Plprand(1, 200), Plprand(0, 7)),
            octave: Pseq([2, Pdup(Plprand(4, 20), Plprand(3, 8, 1))], inf),
            mtranspose: Pdup(Plprand(1, 200), Plprand(-2, 5)),
            hpf: Pseg(Plprand(20, 200), Plprand(3.0, 30.0), \wel, inf),
            ocd: Pseg(Plprand(0.0, 1.0), Plprand(3.0, 30.0), \wel, inf),
            cav: 2,
            cai: Pseg(Plprand(0.0, 1.0), Plprand(3.0, 30.0), \wel, inf),
            amp: Pseg(Plprand(0.2, 0.4), Plprand(3.0, 30.0), \wel, inf) 
            / Pkey(\octave).linlin(3, 8, 1/2, 2),
            stretch: Pseg(Plprand(0.25, 1.5), Plprand(3.0, 30.0), \wel, inf),
        ])
    )
).play
)

