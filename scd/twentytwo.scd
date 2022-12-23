~clean.lsf("~/snd/srf")
(
Pdef(0,
    Pseed(14,
        Pbind(*[
            type: Pwrand2([\cln, \], [1, 9], inf),
            snd: \srf,
            dur: 1/21,
            num: Pwhite(0, 1),
            legato: 599,
            pan: Pmeanrand(0.0, 1.0),
            bgn: Prand([Plprand(0.0, 0.5), Phprand(1.5, 2.0)], inf),
            lpf: Pseg(Plprand(200, 2000), Plprand(90.0, 180.0), \wel, inf),
            lhf: Pseg(Phprand(0.1, 0.5), Plprand(90.0, 180.0), \wel, inf),
            atk: Phprand(9.9, 19.9),
            hld: Phprand(9.9, 19.9),
            rel: Phprand(9.9, 19.9),
            crv: 8.0,
            shp: Pseg(Phprand(0.0, 0.5), Plprand(9.0, 180.0), \wel, inf).trace,
            sho: Pseg(Pmeanrand(0.0, 1.0), Plprand(9.0, 180.0), \wel, inf),
            shi: Pseg(Pmeanrand(0.25, 0.75), Plprand(9.0, 180.0), \wel, inf),
            slo: Pseg(Pmeanrand(0.25, 0.75), Plprand(9.0, 180.0), \wel, inf),
            hit: Pseg(Pmeanrand(0.25, 0.75), Plprand(9.0, 180.0), \wel, inf),
            lot: Pmeanrand(0.25, 0.75),
            ocd: Pwhite(0.0, 1.0),
            ocq: Pwhite(0.0, 1.0),
            tnh: 1/2,
            tng: 19,
            spd: Pxshuf([
                Pseq([0.5, 5.0], 199), Pseq([0.5, 4.5], 299), Pseq([0.5, 4.0], 399), 
                Pseq([0.5, 3.0], 499), Pseq([0.5, 2.5], 599), Pseq([0.5, 1.5], 699),
                Pseq([0.5, 1.0], 799)
            ], inf),
            amp: Plprand(0.45, 0.9),
            cav: 1/2,
        ])
    )
).play;
)
