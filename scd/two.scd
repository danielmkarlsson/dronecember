~clean.lsf("~/snd/srg")
~clean.lsf("~/snd/tap")
~clean.lsf("~/snd/dpl")
(
Pdef(0,
    Pseed(9,
        Ppar([
            Pbind(*[
                type: Pwrand([\cln, \], [2, 1], inf),
                snd: \srg,
                dur: Plprand(4.0, 1/4),
                mul: Pdup(Plprand(3, 9), Prand([1, 2, 4, 8], inf)),
                freq: (25 * Pdup(Plprand(3, 9), Plprand(1, 19)) * Pkey(\mul)),
                legato: 9999,
                pan: Pmeanrand(0.0, 1.0),
                amp: Pseg(Plprand(0.125, 0.25), Plprand(30.0, 90.0), \wel, inf).trace,
                lpf: Pseg(Plprand(200, 20000), Plprand(30.0, 90.0), \wel, inf),
                cav: 1/4,
                spd: 0.88,
                stretch: 1.01,
                num: Pwhite(0, 1),
            ]),
            Pbind(*[
                type: Pwrand([\cln, \], [1, 5], inf),
                snd: \tap,
                dur: Plprand(4.0, 1/4),
                mul: Pdup(Plprand(3, 9), Prand([1, 2, 4], inf)),
                freq: (50 * Pdup(Plprand(3, 9), Plprand(1, 19)) * Pkey(\mul)),
                lpf: Pseg(Plprand(20, 20000), Plprand(30.0, 90.0), \wel, inf),
                legato: 9999,
                pan: Pmeanrand(0.0, 1.0),
                amp: Pseg(Plprand(1/16, 1/8), Plprand(30.0, 90.0), \wel, inf),
                cav: 1/4,
                aux: 1,
            ]),
            Pbind(*[
                type: Pwrand([\cln, \], [1, 4], inf),
                snd: \dpl,
                dur: 1/16,
                legato: 999,
                pan: Pmeanrand(0.0, 1.0),
                amp: Pseg([0, 1/13, 0], Plprand(30.0, 90.0), \wel, inf),
                num: Plprand(0, 431),
                aux: 2,
            ])
        ])
    )
).play
)
