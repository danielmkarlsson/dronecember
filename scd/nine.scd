~clean.lsf("~/snd/trp");
~clean.lsf("~/snd/gls");
~clean.lsf("~/snd/rec");
(
~pat = {|seed, snd, octave, amp, degree, aux, spd|
    var dfl =
    Pbind(*[
        type: Pseq([\cln, \], inf),
        snd: snd,
        octave: octave,
        amp: amp,
        atk: Plprand(6.0, 12.0),
        rel: Plprand(3.0, 6.0),
        crv: 8,
        legato: 19,
        sustain: 19,
        degree: degree,
        scale: Scale.pelog(\just),
        acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
        bgn: Pmeanrand(0.25, 0.75),
        pan: Pmeanrand(0.0, 1.0).trace,
        aux: aux,
        dur: 5 / Plprand(5.0, 11.0),
        spd: spd,
        cav: 1,
        cai: Pseg(Plprand(0.0, 1.0), Plprand(30.0, 90.0), \wel, inf),
    ]);
    Pseed(seed, Pseq([dfl], inf));
};
Pdef(0, ~pat.(1, \gls, Pdup(39, Plprand(1, 4)), Plprand(0.25, 0.5), 
    Pdup(29, Prand([0, 2, 4, 6], inf)), 0, 1.325)).play;
Pdef(1, ~pat.(2, \trp, Pdup(37, Plprand(2, 4)), Plprand(0.125, 0.25), 
    Pdup(27, Prand([1, 3, 5, 7], inf)), 1, 1.5)).play;
Pdef(2, ~pat.(3, \rec, Pdup(35, Plprand(2, 5)), Plprand(0.125, 0.25), 
    Pdup(25, Prand([0, 1, 2, 3], inf)), 2, 1.683)).play;
Pdef(3, ~pat.(4, \ixa, Pdup(33, Plprand(3, 5)), Plprand(0.125, 0.25), 
    Pdup(23, Prand([4, 5, 6, 7], inf)), 3, 1)).play;
Pdef(4, ~pat.(5, \dfd, Pdup(31, Plprand(1, 5)), Plprand(0.25, 0.5), 
    Pdup(21, Pxshuf((0 .. 7), inf)), 4, 1)).play;
Pdef(5, ~pat.(6, \sin, Pdup(29, Plprand(1, 3)), Plprand(0.25, 0.5), 
    Pdup(19, Pxshuf((0 .. 7), inf)), 5, 1)).play;
)

