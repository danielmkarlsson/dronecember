(
Pdef(0,
    Pseed(7,
        Pbind(*[
            type: \cln,
            snd: \sin,
            octave: Pdup(Plprand(1, 19), Pseq([0, 1, 4, 2, 3], inf)) + 0.0913275,
            harmonic: Pseq([
                Pdup(Plprand(1, 2), Plprand(1, 12, 1)),
                Pdup(Plprand(1, 3), Plprand(1, 11, 1)),
                Pdup(Plprand(1, 4), Plprand(1, 10, 1)),
                Pdup(Plprand(1, 3), Plprand(1, 9, 1)),
                Pdup(Plprand(1, 2), Plprand(1, 8, 1)),
            ], inf),
            atk: 4.0,
            rel: 16,
            legato: 99,
            dur: Plprand(0.1, 2.0),
            cav: 2,
            shp: Plprand(0.0, 0.75).trace,
            sho: Pmeanrand(0.0, 1.0),
            shi: Pmeanrand(0.0, 1.0),
            slo: Pmeanrand(0.0, 1.0),
            hit: Pmeanrand(0.0, 1.0),
            lot: Pmeanrand(0.0, 1.0),
            hlf: Pmeanrand(0.0, 1.0),
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.222; // Exponent
                xa.pow(xb);
            }),
            amp: Pmeanrand(0.05, 0.5) * Pkey(\acp).trace,
        ])
    )
).play
)

s.record
Pdef(0).stop
