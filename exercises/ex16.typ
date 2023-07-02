#import "../common.typ": *

// Note 9 ex 4
#exercise[
  Is the judgment $Gamma tack.r x app x : T$ derivable? If yes show a derivation (for some $Gamma, T$), otherwise prove that it is not derivable.
]
#solution[
  Suppose the judgemnt derivable then by inversion lemma we would obtain:
  $Gamma tack.r x : U -> T$ and $Gamma tack.r x : U$, by unicity of typing
  $U -> T = U$ absurd.
]
