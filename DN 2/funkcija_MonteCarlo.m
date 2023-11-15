(* ::Package:: *)

MonteCarloPiSimulacija[n_] := Module[{tockeZnotrajKroga, vseTocke},
  tockeZnotrajKroga = 0;
  vseTocke = n;
  Do[
   {x, y} = RandomReal[{-1, 1}, 2];
   If[x^2 + y^2 <= 1, tockeZnotrajKroga++],
   {vseTocke}
   ];
  4 * tockeZnotrajKroga / vseTocke
]
