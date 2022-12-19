~clean.lsf("~/snd/wsl"); 
~clean.lsf("~/snd/pno");
(
Pdef(0,
    Pseed(0,
        Pbind(*[
            type: \cln,
            dup: Plprand(1, 3),
            snd: Pseq([\wsl, \pno], inf),
            spd: Pseq([1.0, 0.994], inf),
            octave: Pseq([Plprand(1, 5, 1), Plprand(3, 4, 1)], inf),
            amp: Pseq([-3.0, -15.0], inf).dbamp,
            bgn: Plprand(0.0, 0.5).trace,
            pan: Pmeanrand(0.0, 1.0),
            legato: 99,
            scale: Scale.pelog(\just),
            degree: Plprand(0, 7),
            mtranspose: Plprand(-4, 3),
            dur: Plprand(3.0, 12.0),
            atk: Plprand(8.0, 32.0),
            rel: Plprand(4.0, 32.0),
            crv: 0,
            cav: 1,
            cai: Pseg(Pwhite(0.0, 1.0), Plprand(30.0, 90.0), \wel, inf),
        ])
    )
).play
)
