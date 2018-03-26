query {
  repository(name: "repostatus.org", owner: "jantman") {
    object(expression: "master:badges/latest/active_md.txt") {
      ... on Blob {
        text
      }
    }
  }
}
