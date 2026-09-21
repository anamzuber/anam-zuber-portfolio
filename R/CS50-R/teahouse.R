flavor <- readline("Flavor: ")
caffeine <- readline("Caffeine: ")
if (flavor == "Light" && caffeine == "Yes") {
  print("green tea")
} else if (flavor == "Bold" && caffeine == "Yes") {
  print("black tea")
} else if (flavor == "Light" && caffeine == "No") {
  print("chamomile tea")
} else if (flavor == "Bold" && caffeine == "No") {
  print("rooibos tea")
} else {
  print("Please enter Light or Bold for flavor and Yes or No for caffeine.")
}
