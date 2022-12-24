(
Pdef(0,
    Pseed(1,
        Pbind(*[
            type: \cln,
            snd: Pseed(0, Pxshuf([\dfd, \ixa, \saw, \sin, \bow], inf)),
            num: 0,
            lpf: 20000 / Pxshuf([1, 2, 4, 8, 16], inf),
            wid: Pwhite(0.1, 0.5).trace,
            dur: 1/2,
            freq: Pxshuf([261.6, 293.7, 311.1, 392, 415.3], inf) 
            / Pdup(Plprand(1, 5), Pwrand2([1/2, 1, 2, 4, 8], [5, 4, 3, 2, 1], inf))
            / Pseed(0, Pxshuf([8, 1, 1, 1/2, 1], inf)),
            legato: 99,
            atk: Plprand(9.0, 19.0) / Pseed(0, Pxshuf([1, 1, 1, 4, 1], inf)),
            rel: Plprand(11.0, 19.0),
            crv: Pmeanrand(-8.0, 8.0),
            acc: Pfunc{|ev| ev.use {~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: Plprand(0.1, 0.5).round(0.1) 
            / Pseed(0, Pxshuf([1.75, 2.0, 2.0, 2.0, 2.0], inf)) * Pkey(\acp),
            pan: Pwrand2([0.0, 1.0, 0.25, 0.75, 0.5], [1, 2, 4, 2, 1], inf),
            aux: Pseed(0, Pxshuf([0, 1, 2, 3, 4], inf)),
            cav: 4,
        ])
    )
).play;
)

