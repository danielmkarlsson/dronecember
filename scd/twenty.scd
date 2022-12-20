( 
~clean.lsf("~/snd/srg"); ~clean.lsf("~/snd/tap"); ~clean.lsf("~/snd/dpl"); ~clean.lsf("~/snd/ebs"); ~clean.lsf("~/snd/rec"); 
~clean.lsf("~/snd/gng"); ~clean.lsf("~/snd/trp"); ~clean.lsf("~/snd/gls"); ~clean.lsf("~/snd/vnl"); ~clean.lsf("~/snd/bwm"); 
~clean.lsf("~/snd/orb"); ~clean.lsf("~/snd/ocv"); ~clean.lsf("~/snd/ocs"); ~clean.lsf("~/snd/wsl"); ~clean.lsf("~/snd/pno");
)
(
Pdef(0,
    Pseed(6,
        Pbind(*[
            type: \cln,
            snd: Pseed(1, Pxshuf([
                Pwrand2([\srg, \], [1, 0], 1), Pwrand2([\tap, \], [1, 0], 1), Pwrand2([\ebs, \], [1, 0], 1), Pwrand2([\rec, \], [1, 0], 1), Pwrand2([\trp, \], [1, 0], 1), 
                Pwrand2([\gls, \], [1, 0], 1), Pwrand2([\bwm, \], [1, 0], 1), Pwrand2([\orb, \], [1, 0], 1), Pwrand2([\ocv, \], [1, 0], 1), Pwrand2([\ocs, \], [1, 0], 1), 
                Pwrand2([\wsl, \], [1, 0], 1), Pwrand2([\pno, \], [1, 0], 1), Pwrand2([\dpl, \], [1, 0], 1), Pwrand2([\gng, \], [1, 0], 1), Pwrand2([\vnl, \], [1, 0], 1),
            ], inf)),
            spd: Pseed(1, Pxshuf([
                Pwrand2([7.529, \], [1, 0], 1), Pwrand2([4.637, \], [1, 0], 1), Pwrand2([1.29, \], [1, 0], 1), Pwrand2([1.683, \], [1, 0], 1), Pwrand2([1.5, \], [1, 0], 1), 
                Pwrand2([1.33, \], [1, 0], 1), Pwrand2([6.04, \], [1, 0], 1),  Pwrand2([1.0, \], [1, 0], 1), Pwrand2([1.346, \], [1, 0], 1),  Pwrand2([1.231, \], [1, 0], 1), 
                Pwrand2([1.0, 1.0], [1, 0], 1), Pwrand2([0.994, \], [1, 0], 1), Pwrand2([1.0, \], [1, 0], 1), Pwrand2([1.0, \], [1, 0], 1), Pwrand2([1.0, \], [1, 0], 1),
            ], inf)),
            octave: Pseed(1, Pxshuf([
                Plprand(5, 9, 1), Plprand(1, 6, 1), Plprand(3, 6, 1), Plprand(2, 5, 1), Plprand(2, 4, 1), 
                Plprand(1, 5, 1), Plprand(1, 6, 1), Plprand(3, 6, 1), Plprand(2, 3, 1), Plprand(1, 5, 1), 
                Plprand(0, 3, 1), Plprand(2, 3, 1), Plprand(4, 5, 1), Plprand(3, 5, 1), Plprand(3, 5, 1), 
            ], inf)),
            num: Pseed(1, Pxshuf([
                Pwrand2([0, 1], [1, 2], 1), Plprand(0, 0, 1), Plprand(0, 0, 1), Plprand(0, 0, 1), Plprand(0, 0, 1), 
                Plprand(0, 0, 1), Plprand(0, 0, 1), Plprand(0, 0, 1), Plprand(0, 0, 1), Plprand(0, 0, 1), 
                Plprand(0, 0, 1), Plprand(0, 0, 1), Pxshuf((0 .. 431), 1), Pxshuf((0 .. 15), 1), Plprand(0, 0, 1),
            ], inf)),
            bgn: Plprand(0.0, 0.5),
            pan: Pmeanrand(0.0, 1.0),
            legato: 99,
            scale: Scale.pelog(\just),
            degree: Plprand(0, 7),
            mtranspose: Plprand(-4, 3),
            acc: Pfunc{|ev| ev.use { ~freq.value() }},
            acp: Pfunc({|ev|
                var root = 60.0;
                var freq = ev[\acc];
                var xa = root / freq;
                var xb = 0.333; // Exponent
                xa.pow(xb);
            }),
            amp: (Pseed(1, Pxshuf([
                Plprand(-14.5, -14.5, 1), Plprand(-12.0, -12.0, 1), Plprand(-6.0, -6.0, 1), Plprand(-12.0, -12.0, 1), Plprand(-14.0, -14.0, 1), 
                Plprand(-11.0, -11.0, 1), Plprand(0.0, 0.0, 1), Plprand(-13.0, -13.0, 1), Plprand(-9.0, -9.0, 1), Plprand(-15.0, -15.0, 1), 
                Plprand(-9.0, -9.0, 1), Plprand(-6.0, -6.0, 1), Plprand(-6.0, -6.0, 1), Plprand(-6.0, -6.0, 1), Plprand(-6.0, -6.0, 1),
            ], inf)).dbamp * Pkey(\acp) - 18).dbamp.trace,
            dur: Plprand(1.0, 9.0),
            atk: Plprand(4.0, 32.0),
            hld: Plprand(4.0, 32.0),
            rel: Plprand(4.0, 32.0),
            crv: 0,
            cav: 2,
            cai: Pseg(Phprand(0.0, 1.0), Plprand(30.0, 90.0), \wel, inf),
            //aux: Pxshuf((0 .. 10), inf),
        ])
    )
).play
)
