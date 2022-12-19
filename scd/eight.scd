~clean.lsf("~/snd/trp");
~clean.lsf("~/snd/gls");
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
        dur: 4 / Plprand(5, 11),
        spd: spd,
        cav: 1,
        cai: Pseg(Plprand(0.0, 1.0), Plprand(30.0, 90.0), \wel, inf),
    ]);
    Pseed(seed, Pseq([dfl], inf));
};
Pdef(0, ~pat.(0, \gls, Pdup(29, Plprand(1, 4)), Plprand(0.25, 0.5), 
    Pdup(19, Prand([0, 2, 4, 6], inf)), 0, 1.325)).play;
Pdef(1, ~pat.(1, \trp, Pdup(27, Plprand(2, 5)), Plprand(0.125, 0.25), 
    Pdup(17, Prand([1, 3, 5, 7], inf)), 1, 1.5)).play;
)
