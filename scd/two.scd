~clean.lsf("~/snd/srg")
~clean.lsf("~/snd/tap")
~clean.lsf("~/snd/dpl")
(
Pdef(0,
    Pseed(13,
        Ppar([
            Pbind(*[
                type: Pwrand2([\cln, \], [1, 3], inf),
                snd: \srg,
                dur: Plprand(4.0, 1/4),
                mul: Pdup(Plprand(3, 9), Prand([1, 2, 4], inf)),
                freq: (200 * Pdup(Plprand(3, 9), Plprand(1, 7)) * Pkey(\mul)),
                legato: Pkey(\dur) / Pkey(\dur) + 1 * 99999,
                pan: Pmeanrand(0.0, 1.0),
                amp: Pseg(Plprand(1/6, 1/3), Plprand(30.0, 90.0), \wel, inf) * 2,
                lpf: Pseg(Plprand(2000, 20000), Plprand(30.0, 90.0), \wel, inf).trace,
                spd: 0.88,
                stretch: 1.01,
                num: Pwrand2([0, 1], [1, 3], inf),
                hpf: 80,
            ]),
            Pbind(*[
                type: Pwrand2([\cln, \], [1, 9], inf),
                snd: \tap,
                dur: Plprand(4.0, 1/4),
                mul: Pdup(Plprand(3, 9), Prand([1, 2, 4], inf)),
                freq: (200 * Pdup(Plprand(3, 9), Plprand(1, 7)) * Pkey(\mul)),
                lpf: Pseg(Plprand(2000, 20000), Plprand(30.0, 90.0), \wel, inf),
                legato: Pkey(\dur) / Pkey(\dur) + 1 * 99999,
                pan: Pmeanrand(0.0, 1.0),
                amp: Pseg(Plprand(1/8, 1/4), Plprand(30.0, 90.0), \wel, inf) / Pkey(\mul) * 2,
                hpf: 80,
                aux: 1,
            ]),
            Pbind(*[
                type: Pwrand2([\cln, \], [1, 5], inf),
                snd: \dpl,
                dur: 1/16,
                legato: Pkey(\dur) / Pkey(\dur) + 1 * 9999,
                pan: Pmeanrand(0.0, 1.0),
                amp: Pseg([0, Plprand(1/16, 1/4, 1), 0], Plprand(30.0, 90.0), \wel, inf) * 3,
                num: Plprand(0, 431),
                aux: 2,
            ])
        ])
    )
).play;
)
