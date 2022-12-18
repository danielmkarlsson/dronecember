~clean.lsf("~/snd/gng")
(
Pdef(0,
    Pseed(1,
        Pbind(*[
            type: \cln,
            snd: \gng,
            dur: Plprand(1/3, 13.0).trace,
            num: Pdup(Plprand(1, 2), Pxshuf((0 .. 15), inf)),
            spd: Pdup(Plprand(1, 2), Pmeanrand(0.5, 1.5)).round(0.1),
            legato: 99,
            pan: Pmeanrand(0.0, 1.0),
            atk: Phprand(1.0, 2.0),
            hpf: Plprand(20, 200),
            hld: 99,
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: Plprand(0.5, 1.0) * Pkey(\acp),
            cav: 1,
            stretch: Pseg([1.0, 1.5, 1.5, 1.0], 480, \lin, inf),
        ])
    )
).play
)
