#import "../common.typ": *

// Note 9 ex 4
#exercise[
  Is the judgment $Gamma tack.r x app x : T$ derivable? If yes show a derivation (for some $Gamma, T$), otherwise prove that it is not derivable.
]
#solution[
  Suppose the judgement is derivable, then by inversion lemma we obtain
  $Gamma tack.r x : U -> T$ and $Gamma tack.r x : U$. But by unicity of typing
  $U -> T = U$ absurd.
]
