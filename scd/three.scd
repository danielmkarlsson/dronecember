~clean.lsf("~/snd/ebs")
(
Pseed(0,
	Pdef(0,
		Pbind(*[
			type: Pseed(1, Pwrand2([\cln, \], [7, 1], inf)),
			dur: 7 * Pseed(2, Pwrand2([1/2, 1, 2], [1.0002, 1.0001, 1], inf)),
			snd: \ebs,
			atk: 19,
			rel: 19,
			crv: 6,
			legato: 99,
			spd: 1.29,
			pan: Plprand(0.0, 0.5),
			acc: Pfunc{|ev| ev.use { ~freq.value() }},
			acp: Pfunc({|ev|
				var root = 60.0;
				var freq = ev[\acc];
				var xa = root / freq;
				var xb = 0.222; // Exponent
				xa.pow(xb);
			}),
			amp: Plprand(0.5, 0.7) * Pkey(\acp),
			lpf: Plprand(20, 20000).trace,
			octave: Pmeanrand(2, 5).round,
			scale: Scale.harmonicMinor.(\sept1),
			degree: Pxshuf((0 .. 7), inf),
			cav: 1/2,
		])
	).play;
	Pdef(1,
		Pbind(*[
			type: Pseed(3, Pwrand2([\cln, \], [7, 1], inf)),
			dur: 7 * Pseed(2, Pwrand2([1/2, 1, 2], [1, 1.0001, 1.0002], inf)),
			snd: Pseed(4, Prand([\ixa, \sin], inf)),
			atk: 19,
			rel: 19,
			crv: 6,
			legato: 99,
			pan: Phprand(0.6, 1.1),
			acc: Pfunc{|ev| ev.use { ~freq.value() }},
			acp: Pfunc({|ev|
				var root = 60.0;
				var freq = ev[\acc];
				var xa = root / freq;
				var xb = 0.222; // Exponent
				xa.pow(xb);
			}),
			amp: Plprand(0.6, 0.8) * Pkey(\acp),
			lpf: Plprand(20, 20000).trace,
			octave: Pmeanrand(1, 4).round,
			scale: Scale.harmonicMinor.(\sept1),
			degree: Pxshuf((0 .. 7), inf),
			ocd: 1,
			cav: 1/2,
		])
	).play;
)
)
