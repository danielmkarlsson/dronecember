~clean.lsf("~/snd/dpl")
~clean.lsf("~/snd/vnl")
~clean.lsf("~/snd/tap")
(
~sgt = Plprand(15.0, 30.0).asStream;
Pdef(0,
    Pseed(3,
        Pbind(*[
            type: \cln,
            snd: Pwrand2([\dpl, \vnl], [200, 1], inf),
            sgt: Pfunc({~sgt.next}),
            dur: Pseg(Phprand(1/8, 1/49), Pkey(\sgt), \exp, inf),
            bgn: Plprand(0.0, 0.25),
            legato: 999,
            num: Pxshuf((0 .. 431), inf),
            bpf: (32 * Pseg(Plprand(1, 11), Pkey(\sgt) / 4, \exp, inf)).round(32),
            bpq: Pseg(Phprand(0.0, 1.0), Pkey(\sgt), \wel, inf),
            acc: Pfunc{|ev| ev.use { ~bpf.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: (Pseg(Plprand(0.35, 0.7), Pkey(\sgt), \exp, inf) 
            * Pkey(\acp) / Pkey(\bpq).linlin(0.5, 1.0, 1.0, 8.0) / Pkey(\bpf).linlin(128, 384, 1.0, 8.0)).trace,
            dla: Pseg([0, 1, 1, 0, 0], Pkey(\sgt) * 8, \wel, inf),
            hlf: Pseg(Pmeanrand(0.1, 0.9), Pkey(\sgt) * 2, \wel, inf),
            pan: Pmeanrand(0.0, 1.0),
            hld: 99,
            rel: 99,
            dlt: 16,
            dlf: 0.9,
            cav: 16,
        ])
    )
).play;
Pdef(1,
    Pseed(7,
        Pbind(*[
            type: Pwrand2([\cln, \], [1, 18], inf),
            snd: \tap,
            sgt: Pfunc({~sgt.next}),
            dur: Pseg(Phprand(1/9, 1.0), Pkey(\sgt), \exp, inf),
            midinote: 32.cpsmidi,
            harmonic: Pdup(Plprand(1, 6), Plprand(1, 11)),
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: Pseg(Plprand(0.35, 0.7), Pkey(\sgt), \exp, inf) * 1.75 * Pkey(\acp),
            pan: Pmeanrand(0.0, 1.0),
            rel: Plprand(29.0, 99.0),
            legato: 999,
            aux: 1,
        ])
    )
).play;
)
