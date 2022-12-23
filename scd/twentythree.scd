~clean.lsf("~/snd/mtb")
(
Pdef(0,
    Pseed(4,
        Pbind(*[
            type: Pdup(Pseq([7, 1], inf), Pseq([\cln, \], inf)),
            snd: Pseed(0, Pxshuf([\sin, \mtb, \dfd, \ixa, \saw, \sqr, \fmx], inf)),
            wid: Phprand(0.0, 0.5),
            dur: Pdup(Pseq([7, 1], inf), Pseq([1/49, Plprand(9.0, 39.0, 1)], inf)),
            bgn: Plprand(0.0, 0.8),
            spd: 0.996,
            octave: Pwhite(2.0, 5.2).round(0.2), 
            legato: 9999,
            atk: 19,
            rel: 19,
            crv: 0,
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: (Pseg([1/12, 1/8, 1/12], Plprand(9.0, 29.0), \wel, inf) 
                * Pseed(0, Pxshuf([1.8, 0.4, 1.1, 2.7, 1.7, 1.5, 1.7], inf)) 
                * Pkey(\acp)).trace,
            aux: Pseed(0, Pxshuf([0, 1, 2, 3, 4, 5, 6], inf)),
            hpf: Pseed(0, Pxshuf([20, 200, 20, 20, 200, 200, 200], inf)),
            cav: 16,
        ]))
    ).play
)
