~clean.lsf("~/snd/mtf")
~clean.lsf("~/snd/srg")
(
Pdef(0,
    Pseed(7,
        Pbind(*[
            type: \cln,
            snd: Pwrand2([\srg, \mtf], [5, 1], inf),
            dur: 5 / Plprand(3.0, 9.0),
            degree: Pdup(Plprand(1, 9), Pxshuf((0 .. 7), inf)),
            mtranspose: Pdup(Plprand(1, 9), Pxshuf((0 .. 7), inf)),
            octave: Pdup(Plprand(1, 9), Plprand(2, 5)),
            scale: Scale.pelog(\just),
            legato: 199,
            atk: Plprand(2.0, 4.0),
            rel: Plprand(9.0, 99.0),
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: Pdup(Plprand(1, 9), Plprand(1/12, 1/6)) * Pkey(\acp),
            cav: 4,
        ])
    )
).play
)

s.record
