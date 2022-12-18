
~clean.lsf("~/snd/gls")
(
var sequence = [0];
var originalSequence = sequence.copy;
Pdef(0,
    Pseed(9,
        Pbind(*[
            \degree, Pn(Plazy {
                var value = rrand(1, 7);
                sequence = sequence ++ value;
                if (sequence.size > 11) {
                    sequence = originalSequence;
                };
                sequence.debug('seq');
                Pseq(sequence);
            }),
            type: \cln,
            snd: Pwrand2([\ixa, \gls], [1, 7], inf),
            scale: Pdup(65, Pxshuf([
                Scale.aeolian, 
                Scale.mixolydian, 
                Scale.ionian,
                Scale.dorian,
                Scale.locrian,
                Scale.lydian,
                Scale.phrygian,
            ], inf)),
            mtranspose: Pdup(65, Pxshuf((-4 .. 3), inf)),
            octave: Pmeanrand(1, 4).round,
            spd: 1.325,
            atk: Pdup(66, Pseq([2, 1], inf)),
            rel: 6,
            crv: -8,
            dur: Plprand(1/7, 1.0),
            bgn: Plprand(0.0, 0.06),
            legato: 99,
            wid: Plprand(0.0001, 0.25),
            amp: Pseg([0.65, 0.8, 0.65], Pdup(2, Plprand(7.5, 15.0)), \wel, inf) / 2,
            cav: 2,
            pan: Pdup(65, Pseq([Plprand(0.25, 0.5, 1), Phprand(0.5, 0.75, 1)], inf)),
        ])
    )
).play;
)
