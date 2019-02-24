


( // SCEN -1 ~~~ John Henry recording
( // WHERE TO USE THIS? Cello Distortion...
 Ndef(\scen00, {arg amp=1.0, pan=0;
 	var insig, cello;
  // TODO:: SOME KIND OF "OLD RECORDING" Telephone SOUND
 });
);
Ndef(\scen00).play(out:0, numChannels: 2);
);
Ndef(\scen00).clear;


/* SYNTHS FOR PRELUDE:::
MASSIVE:
3 OCTAVE STRINGS (also arp on higher pitch)
Afex Jeff Strings (arp on major chord) - needs Maya's lows
An Air of Detuned Lead
Bladerunner Strings (not arp, but held + distortion)

*/

/**
BIRDMAN IS FUNNY MOUSE ON MARSY KINDA STUFF
**/


( // SCEN 0 - Prelude
// TODO:: MAYA NEEDS TO COME IN MUCH EARLIER - DURING THE DANCING.. NEED TO WORKSHOP HER TONE

// TODO:: be able to control distortion on synth + choice of instrument from SC
// TODO:: why does Reaper track mute/unmute not work?

// TODO:: PREPARE ROBOTIC SINGING VOICE... WORKSHOP THIS TOMORROW MORNING..
// Make a sample...



 Ndef(\general, {arg amp=1.0, pan=0;
 var voiceproc1, voiceproc2, voice, cello, outsig;
  var voiceproc, celloproc;
  voice = SoundIn.ar(m.vox);
  cello = SoundIn.ar(m.cello);
  celloproc = cello;
  celloproc = Decimator.ar(celloproc, 48000, 10) * 1; // optional cello distortion
  voice = (voice * 20).tanh * 0.1;
  voiceproc1 = PitchShift.ar(voice, 0.2, 0.5, 0.0, 0.0) * 1.0;
  voiceproc2 = PitchShift.ar(voice, 0.2, 1.5, 0.0, 0.0) * 1.0;
  voiceproc1 = CombL.ar(voiceproc1, 2, 0.2, 1.0) + voiceproc1;
  voiceproc2 = CombL.ar(voiceproc2, 2, 0.2, 1.0) + voiceproc2;
  voiceproc = [voiceproc1, voiceproc2];
  celloproc = celloproc + PitchShift.ar(celloproc, 0.2, 0.75, 0.3, 0.1);
  celloproc = (celloproc * 20).tanh * 0.4;
  outsig = Mix([voiceproc, celloproc]);
  Limiter.ar(LeakDC.ar(outsig), 1.0, 0.001);
 }).play(out: m.outclean, numChannels: 2);
);
Ndef(\general).clear(5);

// TODO:: Voice Fragmentation
// TESTING VOICE FRAGMENTATION
m.lisa.zone_(4, [0, 401061]); // create a new zone!
m.lisa.loadSampleToZone("Maya_Weapon_Chorus01", 0, 401061, 4, false);
m.lisa.playZone(4);

// Now we make a nice voice fragmentation system...

Pdef(\bgran).clear;

( // Basic Continuous Zone Granulator
m.grains = 50;
m.lisa.selectedZone = 4;
m.zone = m.lisa.zone(m.lisa.selectedZone);
 Pdef(\bgran, Pbind(*[
 	instrument: \gategrain,
  buf: m.lisa.bigbuf,
 	amp: 0.5,
  rate: 1.0,
  atk: 0.01,
  rel: 0.01,
  st: Pseq(Array.series(m.grains, m.zone[0], (m.zone[1] - m.zone[0]) / m.grains), inf),
  dur: 0.05,
  delta: 0.1,
  pan: 0,
  out: m.outclean,
 ])).play(TempoClock);
);

Pbindef(\bgran, \delta, Pseq([0.2, 0.2, 0.1, 0.05] * 2, inf, 3)); // grain rate (gps)
Pbindef(\bgran, \st, Pseq([1000, 10000, 100000, 180000, 320000].stutter(3), inf), \dur, 0.2, \delta, 0.1, \rate, Prand([0.25, 0.5, 1, 1.5, 2],inf));

Pbindef(\bgran, \dur, Pseq([0.2, 0.2, 0.1, 0.05], inf)); // grain dur (s)
Pbindef(\bgran, \atk, 0.01, \rel, 0.02); // grain envelope (atk/rel)
Pbindef(\bgran, \rate, [1.0, 0.75]); // grain pitch ratio
Pbindef(\bgran, \rate, [0.midiratio, -5.midiratio]); // grain pitch






( // SCENE 1 - VOICE FRAGMENTATION FROM PRELUDE & PROCESSING MAYA
// TODO:: Make a simpler & specific processing for Maya here.

Ndef(\general).source = {
  var voiceproc1, voiceproc2, voice, cello, outsig;
  var voiceproc, celloproc;
  voice = SoundIn.ar(m.vox);
  cello = SoundIn.ar(m.cello);
  voiceproc = voice;
  celloproc = cello;
  celloproc = celloproc + PitchShift.ar(celloproc, 0.2, 0.5, 0.3, 0.1);
  celloproc = Decimator.ar(celloproc, 16000, 11) * 1; // optional cello distortion
  celloproc = (celloproc * 10).tanh * 0.6;
  outsig = Mix([voiceproc, celloproc]);
  Limiter.ar(LeakDC.ar(outsig), 1.0, 0.001);
};

// + Tape Gestures
// Drone Comes in from Jeroen...
// Processing of iMacs
// + Big Rewind & Noise when Avi Throws the Trash bag
// TODO:: LOW FREQUENCIES & ZAP+NOISE

);

( // SCENE 2 = ALEX & KRIS
// Thuds, TODO:: processing of Maya
// Ends in Alarm (sinetone beats that transform into Troy's scene)
// sinetone beats stop when Evelyn says "Hello!"




);

// SCENE 3 - TROY AMONGST BODIES
// Sinetone beat come back in synchronized with Troy's entrance
// -> evolves into xylophone melody, needs to transform significantly and become playful
// need drone frequencies that compliment the "Weapon of Prayer" deconstruction

// TODO:: MAKE THIS MORE PLAYABLE // Sine Tone organ
// TODO:: integrate with the henon drone..
// TODO:: make the shift into the drone more amazing, more of a time-space readjustment, with tastes of earlier sound material
// FADE IN
(
// Enter on "kind-volgsystem" from henon drone to sine beats
~sinbus = m.outclean;
~sins = Array.newClear(20);
~sins[0] = Synth(\sin2, [\out, ~sinbus, \freq, "G3".f, \atk, 0.1, \rel, 0.01, \amp, 0.2, \mod1, 1, \mod2, 10, \gate, 1]);
);
~sins[0].gate(0);

// Niels plays in G
// TODO:: Update these syntax & compose better with text.. non-illustrative
// MAKE IT EASIER AND MORE RELIABLE TO ACTIVATE AND DEACTIVE THESE


~sins[1] = Synth(\sin2, [\out, ~sinbus, \freq, "D3".f, \atk, 0.1, \rel, 1, \amp, 0.25, \mod1, 1, \mod2, 10]);
~sins[1].gate(0);


~sins[2] = Synth(\sin2, [\out, ~sinbus, \freq, "Bb4".f, \atk, 10, \rel, 1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \pan1, -1, \pan2,1]);
~sins[2].gate(0);


~sins[3] = Synth(\sin2, [\out, ~sinbus, \freq, "A4".f, \atk, 10, \rel, 1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \pan1, -1, \pan2,1]);
~sins[3].gate(0);

~sins[4] = Synth(\sin2, [\out, ~sinbus, \freq, "E5".f, \atk, 10, \rel, 1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \pan1, -1, \pan2,1]);
~sins[4].gate(0);


~sins[5] = Synth(\sin2, [\out, ~sinbus, \freq, "D6".f, \atk, 10, \rel, 1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \pan1, -1, \pan2,1]);
~sins[5].gate(0);


~sins[6] = Synth(\sin2, [\out, ~sinbus, \freq, "A#6".f, \atk, 10, \rel, 0.1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \pan1, -1, \pan2,1]);
~sins[6].gate(0);


~sins[7] = Synth(\sin2, [\out, ~sinbus, \freq, "F#6".f, \atk, 10, \rel, 0.1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \pan1, -1, \pan2,1]);
~sins[7].gate(0);


~sins[8] = Synth(\sin2, [\out, ~sinbus, \freq, "E6".f, \atk, 10, \rel, 0.1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \spread, 1.0]);
~sins[8].gate(0);


~sins[9] = Synth(\sin2, [\out, ~sinbus, \freq, "C7".f, \atk, 10, \rel, 0.1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \spread, 1.0]);
~sins[9].gate(0);

~sins[10] = Synth(\sin2, [\out, ~sinbus, \freq, "D8".f, \atk, 10, \rel, 0.1, \amp, 0.1, \mod1, 3.01, \mod2, 4, \spread, 1.0]);
~sins[10].gate(0);

// stop all
~sins.do {|sin| if(sin.notNil) { sin.gate(0) }};
// TODO:: SLOW RELEASE ON SINE TONES


// SCENE 3.5 - PATTERNS & CHAOS (sequence)
// TODO:: Layer sine drones in phase relationships on the tape machines


// VOX mics take the rhythms here
( // WORK ON THIS! Or have separate processes for cello & vox mics
 Ndef(\jawharps, {
 	var jawharpin, outsig, amp=1.0, pan=0;
  var jh1, jh2;
  jawharpin = SoundIn.ar(m.vox) * 4.0;
  jh1 = PitchShift.ar(jawharpin, 0.2, 1.4, 0.0, 0.0);
  jh2 = PitchShift.ar(jawharpin, 0.2, 0.7, 0.0, 0.0);
  jh1 = Pan2.ar(jh1, Pulse.ar(7.5).range(-1,1)); // tune this tempo to match the beat
  outsig = (jh1+jh2) * 2.0;
  Limiter.ar(LeakDC.ar(outsig), 1.0, 0.001);
 }).play(out:m.outclean, numChannels: 2);
);

Ndef(\jawharps).clear(5);


( // SCENE 3.5 LOAD FIRST.. PLAY BELOW
  var start, end, smpl;
  smpl = ["TechnoA#004", 1, 0, 43982];
  start = smpl[2]; end = smpl[3];
  smpl = Smpl.at(smpl[0]);
Pdef(\bass35, Pbind(*[
 	instrument: \pitchedSample1ch,
  delta: 1/4,
 	amp: 0.3,
  rate: 1,
  rootPitch: 440,
  rangestart: start,
  rangeend: end,
  freq: Prand(["A5", "E6", "F#5"].f, inf),
  start: start,
  end: end,
  buf: smpl.buffer,
  out: m.outclean,
  atk: 0.01,
  rel: 0.1,
  pan: Pseq([-1,1], inf),
  co1: 18000,
  rq1: 1.0,
 ]));

  smpl = ["TechnoA#009", 1, 0, 44093];
  start = smpl[2]; end = smpl[3];
  smpl = Smpl.at(smpl[0]);
Pdef(\clap35, Pbind(*[
 	instrument: \pitchedSample1ch,
  delta: 1/4,
 	amp: 0.2,
  rate: 1.0,
  rootPitch: 440,
  rangestart: start,
  rangeend: end,
  freq: Prand(["A5", "E6", "F#5"].f, inf),
  start: start,
  end: end,
  buf: smpl.buffer,
  out: m.outclean,
  atk: 0.01,
  rel: 0.1,
  pan: Pseq([-0.8,0.8], inf),
  co1: 18000,
  rq1: 1.0,
 ]));

TempoClock.tempo = 70/60;
Pbindef(\clap35, \delta, 1/4);
Pbindef(\bass35, \delta, 1/4);
Pbindef(\clap35, \amp, 0.5);
Pbindef(\bass35, \amp, 0.3);
);

// TODO:: Prepare so that it starts with a downbeat..

// SCENE 3.5 PLAY
~sins.do {|sin| if(sin.notNil) { sin.gate(0) }};

Pdef(\clap35).play(TempoClock, quant: 0);
Pdef(\bass35).play(TempoClock, quant: 0);

Pdef(\clap35).pause;
Pdef(\bass35).pause;

// Kill em
Pdef(\clap35).clear;
Pdef(\bass35).clear;


// Steady / Rehearsal 22
TempoClock.tempo = 70/60;
Pbindef(\clap35, \delta, 1/4);
Pbindef(\bass35, \delta, 1/4);

(
Pbindef(\clap35, \amp, 0.5);
Pbindef(\bass35, \amp, 0.3);
);

(
Pbindef(\clap35, \amp, 0.0);
Pbindef(\bass35, \amp, 0.0);
);


// Stop all
Ndef(\jawharps).clear(10);
Pdef(\clap35).clear;
Pdef(\bass35).clear;




// TODO: Returns with flagellete // use sin tone analysis of flags & strings
~sins = Array.newClear(10);
~sins[9] = Synth(\sin2, [\out, ~sinbus, \freq, "C7".f, \atk, 10, \rel, 6, \amp, 0.1, \mod1, 3.5, \mod2, 4, \spread, 1.0]);
~sins[9].gate(0);

~sins[10] = Synth(\sin2, [\out, ~sinbus, \freq, "D8".f, \atk, 10, \rel, 10, \amp, 0.06, \mod1, 3.01, \mod2, 4, \spread, 1.0]);
~sins[10].gate(0);

// sync to these tones
~sins[5] = Synth(\sin2, [\out, ~sinbus, \freq, "D6".f, \atk, 10, \rel, 4, \amp, 0.1, \mod1, 3.5, \mod2, 4, \spread ,1]);
~sins[5].gate(0);

~sins[4] = Synth(\sin2, [\out, ~sinbus, \freq, "C9".f, \atk, 10, \rel, 4, \amp, 0.1, \mod1, 3.5, \mod2, 4, \spread ,1]);
~sins[4].gate(0);

Ndef(\jawharps).clear(5);

~sins.do {|sin| if(sin.notNil) { sin.gate(0) }};
Ndef(\jawharps).clear(1);
Pdef(\clap35).clear;
Pdef(\bass35).clear;

// TODO:: Make a panic/reset button ... CMD period without the CMD period.. so the MPK doesn't get reset.

// SCENE 4 - ACOUSTIC/FIDDLE JAMS WITH ALEX & EV

// CUE:: Bleep Gesture when the Sync Identities

// TODO: CLEAN UP THIS SCENE TO ALLOW REVERB TAIL FROM SEGMENTS THEY PLAY

( // TODO:: Reverb Tail (fix ths)
Ndef(\verbtail, {
  var vox, cello, inst, outsig, amp=1.0, pan=0;
  vox = SoundIn.ar(m.vox);
  cello = SoundIn.ar(m.yamamix);
  inst = SoundIn.ar(m.inst);
  outsig = vox + cello;
  outsig = GVerb.ar(outsig, 100, 4, 0.2, 0.2, 25, 1, 0.7, 0.6);
  Limiter.ar(LeakDC.ar(outsig), 1.0, 0.001);
}).play(out: m.outverb, numChannels: 2);
);
Ndef(\verbtail).clear;

// TODO:: MORE FADE IN ON REZPADS





// SCENE 4.5 - Phone Call

// CUE TO START EARTHSONG IS WHEN JOOST WAVES HIS HAND
// TODO: WORKSHOP EARTHSONG & NOTATE / FIX WITH THE IMAC (power up & specific moments)

( // PHONE CALL ~~ Run me SCENE 4.5
~phonetime = 1/4;
~phonedur = 0.1;
Tdef(\phonecall, {
  inf.do {|i|
    (instrument:'fm01', freq: "F#6".notecps, modhz: 15830, dur: 0.1 * ~phonedur, amp: 0.2, atk: 0.1, rel: 0.01, out: 10).play;
    (instrument:'fm01', freq: "A6".notecps, modhz: 18830, dur: 0.1 * ~phonedur, amp: 0.3, atk: 0.1, rel: 0.1, out: 10).play;
    (instrument:'fm01', freq: "A7".notecps, modhz: 18830, dur: 0.1, amp: 0.6, atk: 0.01, rel: 0.01, out: 10).play;
    ~phonetime.wait;
  };
}).play(TempoClock, quant: 1);
);
~phonetime = 3; // slowly shrink this
~phonedur = 0.1; // go from full to soft

// TODO:: Compose a slow evolution here. Reverb in Reaper
// TODO:: as if running out of time
~phonetime = 1.7;
~phonedur = 0.001;

Tdef(\phonecall).stop;

Ndef(\drone).clear(1);
Ndef(\droneProc).clear(1);


// TODO:: Also needs a clear 1 for earthsong
( // SCENE 5 & 6 ~ Your Place in the World
// WORLDSONG
// Work with imacs to find specific moments to come in
// Not so much melodies from the strings / hold long notes and go back to pulses...
// DECIDE WHEN TO MAKE THE CHORDAL CHANGES...
// Use the strings to include rhythmic variation...

// TODO:: Fading in and out abstraction
// TODO:: enter with a SHARP attack on the first note

// Stop me at dag zusje / Joost waves his hand and earthsong starts
Tdef(\phonecall).stop;


Ndef(\drone, {|amp=1.0, dur=1, t_trig=0|
	var sig1, sig2, mix, freq, depth=0.7;
  var env1, env2, envripple, atk, rel, period=0.21;
  freq = \freq.kr("G4".notecps, \lag.kr(2));
  atk = period * 0.01;
  rel = period - atk;
  envripple = Env([1,depth,1,depth,1,depth,1,depth,1,depth],
    [atk, rel, atk, rel, atk, rel, atk, rel, atk, rel], -4);

  sig1 = (Saw.ar(freq * Scale.major.ratios2(0, 21, 1.25), mul: 0.1)) * (SinOsc.ar(MouseY.kr(0.2,3), pi / 2));
	sig1 = Splay.ar(sig1, 0.0, center: SinOsc.ar(0.5).range(-0.8,0.8));
	sig1 = BLowPass4.ar(sig1, MouseX.kr(100, 6000, -3), 0.5);

	sig2 = GVerb.ar(CombL.ar(sig1.sum, 1, 0.1, 1), 10, 1, 0.5, 0.5, 15, 1, 0.7, 0.6, mul: 0.2);
	sig2 = (sig2*20).tanh;
  //sig * 0.2;
	mix = sig1+(sig2*0.2) * 2;

  env1 = EnvGen.ar(Env.perc(0.01), t_trig, timeScale: dur);
  env2 = EnvGen.ar(envripple, t_trig);

  mix = mix * env1 * env2 * amp;
});


// Very beautiful: Bodysong-like ... work more with this, make a long extended composition

Ndef(\drone).set(\amp, 2.0);
Ndef(\drone).play(out: m.outclean, numChannels: 2);
);




// TODO:: Process imac HDD tones to tune them
(
Ndef(\imachdd, {

}).play(out: m.outclean, numChannels: 2);
);
Ndef(\imachdd)

// TODO: Make this synth & pattern based (using a Pmono) with more complex rhythms



/***** SCENE 5 *****/
// Kris SCENE 5

(
Tdef(\earthsong, {
  var del=1;
  inf.do {|cnt|
    Ndef(\drone).set(\t_trig, 1);
    del.wait;
  };
}).play(TempoClock, quant: 0);
);

Ndef(\drone).set(\freq, "G4".notecps, \lag, 2.5); // G/C/D
Ndef(\drone).set(\freq, "Ab3".notecps, \lag, 2.5); // Ab/Db/Eb
Ndef(\drone).set(\freq, "Eb3".notecps); // Eb3/Ab/Bb
Ndef(\drone).set(\freq, "A3".notecps); // A/D/E


// CUE:: STOP @ Kris, "links liet leggen en rechts bent gegaan"
Tdef(\earthsong).pause;



/***** SCENE 6 *****/
// Troy SCENE 6


// CUE:: RE-ENTER / ADAM ""
Tdef(\earthsong).play;
Ndef(\drone).set(\lag, 0.1, \freq, "C3".notecps); // C/F/G
Ndef('drone').set(\freq, "Ab3".notecps, \lag, 2); // Ab3/Db/Eb
Ndef('drone').set(\freq, "G3".notecps); // G/C/D
Ndef('drone').set(\freq, "F3".notecps); // F/Bb/C
Ndef('drone').set(\freq, "G3".notecps); // G/C/D

Tdef(\earthsong).pause;
Tdef(\earthsong).play;

// TODO:: Make the wash part more focused Gmajor chord
// TODO:: Make it so that the drone transforms into a wash...
// TODO:: Make a synthetic voices utopia
// TODO:: Transform the drone into a wash that is holy and a tight Gmaj


// fade out
Gest.fade(Ndef(\drone), 1.0, 0.0, 20, 200);

// Clear all
Tdef(\earthsong).stop;
Ndef(\drone).clear;


/*****************************/



// *** SCENE 7 *** Kris Enters & Abstract Bonsoir Moreau Dance Piece
// CUE: Kris enters with henon frenzy
// CUE: abstract dance beats with Bonsoir Moreau harmonies
// CUE: Kris: "Resume", return to henon frenzy

/*
["Prelude_G_SynthVoice_English", 2, 0, 3883392]
["Prelude_C_SynthVoice_Japanese", 2, 0, 4235904]
*/
/******** Henon Clutch  ********/

// TODO:: listen to some minimal techno EDM for inspiration.. cajun feel somehow?
// TODO:: MAKE THIS MORE PLAYABLE
// TODO:: COMPOSE / MIX & MASTER THIS ONE WITH SOME DUCKING...
// TODO:: pan & variation
// TODO:: clean this up & make some gestures to follow Kris' manipulations of Adam
// TODO:: & Adam's standby shutdown
// TODO:: another gesture besides the henon chaos?
// TODO:: make a tape with marked sections (leader tape) for anything that's more or less not played but automated..
(
Pdef(\hen, Pbind(*[
  instrument: \chao1,
  out: m.outverb,
  dur: Prand([1,2,0.5], inf),
  delta: Prand([2,3,4], inf),
  amp: 0.5,
  st_rate: Pwhite(0.5,7),
  end_rate: Pwhite(10,20),
  p1: 1.23,
  p2: 1.15,
  srange: 400,
  erange: 22050
])).play(TempoClock, quant: 1);
);

Pbindef(\hen, \amp, 0.6, \delta, 10, \dur, 0.2, \p1, 1.24, \bass35, 0.18, \st_rate, 1, \end_rate, 1);

Pdef(\hen).clear;

Pdef(\hen2, Pbind(*[
  instrument: \chao2,
  out: ~noisebus,
  freq: Pseq(["A6", "C7", "A8"].collect(_.f),inf),
  dur: Pwhite(0.4, 0.5),
  delta: Pseq([1/4,1/8,1/4,1/4], inf),
  root: 0,
  ctranspose: 0,
  mtranspose: 0,
  amp: 0.3,
  p1: 1.1,
  p2: 0.23,
])).play(TempoClock, quant: [1,2.5]);
);



Pbindef(\hen2, \freq, Pseq([220000, 42000], inf));

Pbindef(\hen2, \mtranspose, 0);
Pbindef(\hen2, \root, 0);

Pbindef(\hen2, \p1, 0.2,\bass35, 0.23);

// Growing strings building

Pbindef(\hen2, \p1, 1.2, \bass35, 0.23);

Pbindef(\hen2, \freq, Pseq([["A7","C8"].f, Rest()], inf));

Pbindef(\hen2, \freq, Pseq([["A7","C8"], "D#8"].f, inf));

Pbindef(\hen2, \freq, Pseq([["A7","C#8"], "D#7"].f, inf));


Pbindef(\hen2, \delta, Pseq([1/4, 1/4, 1/4, Rest(1/8)], inf));

Pbindef(\hen2, \dur, [1/8,1/4,1/8].pseq);

Pbindef(\hen2, \dur, 1.0, \delta, 2, \atk, 0.2, \rel, 0.2)

(
Pbindef(\hen2, \dur, [1.5, 1.5, 0.5, 1.25].pseq, \freq, [
  ["A6", "C8", "C9"],
  "Eb7",
  ["G5", "F6"].prand,
  ["E8", "G9"]
].f.pseq,
\legato, 2);
);

(
Pdef(\hen, Pbind(*[
  instrument: \chao1,
  out: m.outverb,
  dur: Prand([1,2,0.5], inf),
  delta: Prand([2,3,4], inf),
  amp: 0.5,
  st_rate: Pwhite(0.5,7),
  end_rate: Pwhite(10,20),
  p1: 1.23,
  p2: 1.15,
  srange: 400,
  erange: 22050
])).play(TempoClock, quant: 1);
);


// TODO:: lead into the next scene by going up in energy // bring back to the white zone
// TODO:: make some kind of gesture..
Pdef(\hen).clear;
Pbindef(\hen, \amp, 0.6, \delta, Pwhite(0.1,0.2), \dur, 0.01, \p1, 1.24, \bass35, 0.18, \st_rate, 1, \end_rate, 1);


// TODO:: WorldSong goes until here, turns into bonsoir moreau -> NEED TO BE ABLE TO CONTROL FILTER PARAMS FROM MPK AND NOT MOUSE!!!!



// SCENE 8 - SlaughterHouse
// PANNING IMAC SIGNAL
(
 Ndef(\imacpan, {arg amp=1.0, pan=0;
 	var imac, outsig;
  imac = SoundIn.ar(m.yamamix);
  outsig = Pan2.ar(imac, SinOsc.ar(SinOsc.ar(0.1).range(0.25, 2)));
 }).play(out: m.outclean, numChannels: 2);
);

// TODO:: Some sinus tones, drifting in the air

Ndef(\imacpan).clear(5);
Pdef(\hen).clear(5);


// SCENE 9 - Lucy / Polyrhythms
// Loops & Delays & Speed Changes
// String can bring in speed change by playing double tempo
// Otherwise work on Noah's tonalities/intervals

// PROCESSING TESTS FOR LUCY, ONSETS FROM V & N
// TODO:: More variation & sophistication in the response...
(
 Ndef(\lucy, {arg amp=1.0, pan=0, thresh=1.0;
 	var insig, outsig, chain, onsets;
  insig = SoundIn.ar(m.yama1);
  // ONSETS??
  chain = FFT(LocalBuf(512), insig);
  onsets = Onsets.kr(chain, thresh, \rcomplex);
  outsig = PitchShift.ar(insig, 0.2, 0.2) + PitchShift.ar(insig, 0.2, 0.2);
  outsig = EnvGen.ar(Env.perc(0.001, 0.1), onsets) * SinOsc.ar([40,80]);
  outsig;
 }).play(out:m.outclean, numChannels: 2);
);


// CUE: Wall starts moving (add delay / recording to percussion)
// CUE: WHEN HELMET IS GIVEN
Ndef(\lucy).clear(5);


// SCENE 9.5 TROY REDZONE TOUR (short dialog between Troy and Adam)

// CUE: STOP TAPE / START DRONE --- Troy steps into the red floor




// SCENE 10 (+SCENE12) - This Train is Bound for Glory (PONG!)
// All of Kris' monologs

// TODO: Dig up some Atari sounds from Sample Lib

// TODO: Make playing this easier -> include Atari sounds in the sampler
// SOUND EFFECTS: Space Invaders, Pong, Super Mario Brothers

/* SYNTHS FOR PONG:::
MASSIVE:
Anno 1983
*/




// TODO::: Make a (chiptune)synth solo here to work with xylo & fiddle...

// Follow bass line & Freestyle at the beginning until Noa's solo
// TODO: look at melodies
Smpl.splay("07", 13550, 20600, 0.1, 1.0, m.outclean, 14000, 0.2, 1);
Smpl.splay("07", 13550, 20600, 0.075, 1.0, m.outclean, 14000, 0.2, -1);
Smpl.splay("07", 3500, 20600, 0.2, 1.0, m.outclean, 8000, 2, -1);

// Noa's solo goes up a major 2nd

// Play this before the xylo solo
Smpl.splay("07", 3500, 20600, 0.4, 1.0, m.outclean, 8000, 2, 1);
Smpl.splay("07", 13550, 20600, 0.25, 1.0, m.outclean, 14000, 0.2, -1);

( // WORK ON THIS! Or have separate processes for cello & vox mics
 Ndef(\voxweird, {
 	var jawharpin, outsig, amp=1.0, pan=0;
  var jh1, jh2;
  jawharpin = SoundIn.ar(m.vox) * 4.0;
  jh1 = PitchShift.ar(jawharpin, 0.2, 2, 0.0, 0.0);
  jh2 = PitchShift.ar(jawharpin, 0.2, 0.5, 0.0, 0.0);
  jh1 = Pan2.ar(jh1, SinOsc.ar(20).range(-1,1)); // tune this tempo to match the beat
  outsig = (jh1+jh2) * 1;
  Limiter.ar(LeakDC.ar(outsig), 1.0, 0.001);
 }).play(out: m.outclean, numChannels: 2);
);
Ndef(\voxweird).clear(5);

// PONG / ONSET TRIGGERS
(
 Ndef(\pong, {arg amp=1.0, pan=0, thresh=1.0;
 	var insig, outsig, chain, onsets;
  insig = SoundIn.ar(m.yamamix);
  // ONSETS??
  chain = FFT(LocalBuf(512), insig);
  onsets = Onsets.kr(chain, thresh, \rcomplex);
  outsig = PitchShift.ar(insig, 0.2, 0.2) + PitchShift.ar(insig, 0.2, 0.2);
  outsig = EnvGen.ar(Env.perc(0.001, 0.1), onsets) * SinOsc.ar([40,80]);
  outsig;
 }).play(out:m.outclean, numChannels: 2);
);
Ndef(\pong).clear;

// go into electricity and fade
(
Pdef(\gamesnd, Pbind(*[
 	instrument: \pitchedSample1ch,
 	dur: 0.1,
 	amp: 0.3,
  start: 13550,
  end: 20600,
  rootPitch: "A4".f,
  freq: "A4".f * 0.2,
  atk: 0.001,
  rel: 0.1,
  co1: 4000,
  rq1: 0.2,
  out: m.outclean,
  pan: Pseq([1,-1], inf),
  buf: Smpl.at("07").buffer
 ])).play(TempoClock, quant: 1);
);
Pbindef(\gamesnd, \amp, 0.5, \freq, Pseq(["A4", "D5", "G6", "B4"].f / 6,inf));
Pbindef(\gamesnd, \amp, 0.5, \freq, Pseq([["A4", "C4"], "D5", ["B4","G6"]].f / 5,inf));
Pbindef(\gamesnd, \amp, 0.5, \freq, Pseq([["A4", "C6"], "D4", "F5", ["B6","G6"]].f / 7,inf));
Pbindef(\gamesnd, \amp, 0.5, \freq, Pseq([["A4", "C6"], "D4", "F5", ["B6","G6"]].f / 2,inf));
Pbindef(\gamesnd, \delta, Pwhite(0.1, 0.2, inf));
Pbindef(\gamesnd, \amp, Ndef(\fo1, { Line.ar(0.5, 0, 10) })); // fade out
Pbindef(\gamesnd, \amp, 0.0);

Pdef(\gamesnd).clear;

// CUE:: END XYLO SOLO, DROP BACK DOWN TO Dmin

// 10.5 --- ELECTRICITY ---- SIMULTANEOUSLY WITH KRIS' MONOLOG
// TODO: BREATH PIECE / GODWASH / OR HARMONICA STRETCH

// TODO HERE: EXTREME TIME STRETCH END CHORD / PROCESS VOICE

// Db major chord
(
~sins = Array.newClear(20);
~sinbus = m.outclean;
~sins[9] = Synth(\sin2, [\out, ~sinbus, \freq, "D7".f, \fratio, 1, \atk, 2, \rel, 2, \amp, 0.1, \mod1, 3.5, \mod2, 4, \spread, 1.0]);
);
~sins[5] = Synth(\sin2, [\out, ~sinbus, \freq, "Db6".f, \atk, 2, \fratio, 1, \rel, 2, \amp, 0.1, \mod1, 3.5, \mod2, 4, \spread ,1]);
~sins[10] = Synth(\sin2, [\out, ~sinbus, \freq, "F7".f, \atk, 2, \fratio, 1, \rel, 2, \amp, 0.06, \mod1, 3.01, \mod2, 4, \spread, 1.0]);

~sins[10].gate(0);
~sins[9].gate(0);
~sins[5].gate(0);

~sins.do {|it| if(it.notNil) {it.free} };


// MUTE - PROCESS STRINGS

// TODO HERE: REVERB TAILS
// TODO HERE: Vocoder?
( // TODO:: Also distortion on Noa
Ndef(\stringfilter, {arg amp=1.0, pan=0;
 	var instin, outsig;
  instin = SoundIn.ar(m.inst);
  outsig = BLowPass4.ar(instin, 1200, 0.6);
  outsig = Pan2.ar(outsig, 0, 1.0);
  Limiter.ar(LeakDC.ar(outsig));
 });
);
Ndef(\stringfilter).play(out:0, numChannels: 2);
Ndef(\stringfilter).clear(5);

Smpl.gui;
["Prelude_C_SynthVoice_Japanese", 2, 0, 4235904]
["Prelude_G_SynthVoice_English", 2, 0, 3883392]


// TODO:: TEXT CUES:: Note! Panning doesn't work in stereo.. fix it

x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 0, 10000, 0.5, 1.0, m.outverb, 20000, 1, 1);

// TODO:: Alarm
x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 0, 10000, 1.0, 1.0, m.outverb, 20000, 1, 0);

x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 80000, 110000, 1.0, 1.0, m.outverb, 20000, 1, 0);
x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 0, 40000, 1.0, 1.0, m.outverb, 20000, 1, 0);
x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 280000, 310000, 1.0, 1.0, m.outverb, 20000, 1, 0);
x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 280000, 610000, 1.0, 1.0, m.outverb, 20000, 1, -0.5);
x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 1780000, 1810000, 1.0, 1.0, m.outverb, 20000, 1, -0.5);
x = Smpl.splay("Prelude_C_SynthVoice_Japanese", 2080000, 2110000, 1.0, 1.0, m.outverb, 20000, 1, -0.5);

x = Smpl.splay("Prelude_G_SynthVoice_English", 2080000, 2410000, 1.0, 1.0, m.outverb, 20000, 1, 0);
x = Smpl.splay("Prelude_G_SynthVoice_English", 2480000, 2510000, 1.0, 1.0, m.outverb, 20000, 1, 0);

// TODO:: USE THE CHOIRS FOR THE "ALARM"" SCENE
// CUE:: I play feedback & delay with voices, cello, and text of actors
// CUE:: "I know" -> start the beat with Maya
// CUE:: TAPE MACHINE MUST BE SLOW ON ADJUSTABLE SPEED, ALSO MUST BE MONO TO AVOID PHASED BEATS
// TODO:: OR PUT IT ON A LOOP ON THE SECOND MACHINE, OR A LOW FREQUENCY FOR VITALY TO PLAY ON RV2
x.free;



( /**** SEQUENCE END PART1 ****/
// 11 --- Collecting Debts ~ Party Buildup
// ELECTRONIC BLIPS COME IN FROM EARLIER IN A MORE STRUCTURED WAY, DIES OUT QUICKLY
// Begins with a THUD, and builds to the party beat.
// Process Maya

// TODO:: BE ABLE TO ADJUST RING LENGTH OF THE BASS KICK
// TODO:: prepare a pattern
// TODO:: Make a macro/make it easy to build a sample pattern
Pdef(\party).clear;
(
 Pdef(\party, Pbind(*[
 	instrument: \default,
 	dur: 1.0,
 	amp: 0.5,
])).play(TempoClock, quant: 1);
);

Pbindef(\party, \dur, 0.5);

// ONSETS FOR NIELS / WASHBOARD

// onsets for tape drumming
// TODO:: Be able to get specific signals from the Yamaha
 Ndef(\tape, {arg amp=1.0, pan=0, thresh=1.0;
 	var insig, outsig, chain, onsets;
  insig = SoundIn.ar(m.yama1);
  // ONSETS??
  chain = FFT(LocalBuf(512), insig);
  onsets = Onsets.kr(chain, thresh, \rcomplex);
  outsig = PitchShift.ar(insig, 0.2, 0.2) + PitchShift.ar(insig, 0.2, 0.2);
  outsig = EnvGen.ar(Env.perc(0.001, 0.1), onsets) * SinOsc.ar([40,80]);
  outsig;
 }).play(out:m.outclean, numChannels: 2);

Ndef(\tape).clear(5);


// 12 --- PARTY BEAT WITH MAYA & STRINGS
// BALCONY --- CUE: Troy steps on to the red, STRINGS DROP OUT


// TODO:: PROCESS THE YAMAHA TO BE TIGHTER BASS
// TODO:: PROCESS THE TAPE MACHINES TO IMPROVE DRUM SOUNDS





// Builds militantly (cue: ??? --- what to add? sample)

// Revolution (strings re-enter) --
// ADD LOOP & SAMPLE TO THE BEAT TO BE HEAVIER
// TODO: Add synths & distortion


// Kris ending (silent or big?)

// FEED SINGING INTO THE TAPE MACHINE ~~~ DISSOLVE THE BEAT INTO A TEXTURE...

// TODO:: Dance beat at 160 BPM instead of the tape machine's natural tempo.







// PART 2 !!! SCENE 14 ~ Love Scene ~ Go to Sleep/Thats Allright

// TODO:: CLEAR EVERYTHING & RESET
Ndef(\tape).clear(5);


// TODO:: Vocaloid does one round also
// TODO:: Voice process myself with pitch shifters for Hmm-mmm humming

// TODO:: DRONE TAPE PROCESSING ON CPU - PITCH SHIFT

// SCENE 15 - TROY ENTERS THE RED ZONE
// ORCHESTRAL DRONE 1


// SCENE 16 - EVALUATION TALK ADAM/ALEX



// SCENE 17 - TROY IS DISCONNECTED FROM THE SYSTEM
// ORCHESTRAL DRONE 2

 // PHONE CALL ~~ Run me on Troy call cues..
~phonetime = 1/4;
~phonedur = 0.1;
Tdef(\phonecall, {
  5.do {|i|
    (instrument:'fm01', freq: "F#6".notecps, modhz: 15830, dur: 0.1 * ~phonedur, amp: 0.2, atk: 0.1, rel: 0.01, out: 10).play;
    (instrument:'fm01', freq: "A6".notecps, modhz: 18830, dur: 0.1 * ~phonedur, amp: 0.3, atk: 0.1, rel: 0.1, out: 10).play;
    (instrument:'fm01', freq: "A7".notecps, modhz: 18830, dur: 0.1, amp: 0.6, atk: 0.01, rel: 0.01, out: 10).play;
    ~phonetime.wait;
  };
}).play(TempoClock, quant: 1);



(
Ndef(\electric, {
  var sig;
  sig = Dust2.ar(SinOsc.ar(0.1).range(20,50), mul: 1.0) * LFNoise1.ar(1).range(0.0, 1.0) * LFNoise0.ar(0.1).range(0.5,1);
  Resonz.ar(sig, 5400, 1);
}).play(out: m.outclean);
);
Ndef(\electric).clear(5);



// *** SCENE 18 - ALEX met EEN Evelyn (Kris)



// TODO:: make electronic voice rhythms here to follow Niels & V
// TODO:: use during "break"

~bufs = Array.newClear(3);
~bufs[0] = Buffer.loadDialog;
~bufs[1] = Buffer.loadDialog;
~bufs[2] = Buffer.loadDialog;

~bufs[0];


// TODO:: Make voice munger / patterner for this sequence..
Smpl.at("");

e = Mung.new(1, ~bufs);
e.gui;
e.play;
e.stop;





// *** SCENE 19 - Troy at the Service Desk
// Red & White Zone become blurred


// TODO:: work on harmonic content with Jeroen / I can also play banjo?
// TODO:: Use ducking from Vitaly & Niels on the Red Zone



// *** SCENE 20 - Troy and the Mother
// Vocal Tape Loops

// TODO:: Work on SCENE 18 // integrate electronics & get Jeroen's horror drones to stop before Kris' scene.

// *** SCENE 21 - Alex is Leaving (STANDBY DRONE & )
// Standby Drone (iMac) and Heartbeat, Needs some variation
// Drone Processing







/**** SCENE 22 ***** ENDSPEL **** ENDSPEL ********/







// TODO:: make a rezpad patch for playing freely


( //*** ENDSPEL - KRIS AS INFORMATION BEING
// TODO:: VOICE PIECE / VOICE PROCESSING PIECE & GRANULATION

// TODO:: GOES INTO TROY'S LECTURE

);

// 23 ~~ ENDSCENE:: LUCY
( // WEAPON OF PRAYER (Sacred Harp)
// CUE:: SINGING COMES IN

);





