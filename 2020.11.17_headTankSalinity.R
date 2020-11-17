

#' function to calculate the volume of high salinity water to add to head tank
#' @param initVol intial volume of water in the  head tank (L)
#' @param initVol intial salinity of water in the  head tank (ppt)
#' @param targetVol target final of water in the  head tank (L)
#' @param targetS target final salinitiy of water in the head tank (ppt)
#' @param highSwater salinity of high salinity water that will be added to the tank (ppt)
addHighSalwater <- function(initVol, initS, targetVol, targetS, highSwater){
  # these these estimation calculation assume psu ~ ppt
  # target final total grams of salt in tank 
  targetSgram <- targetVol * targetS
  # current grams of salt in tank
  currentSgram <- initVol * initS
  # grams of salt that need to be added to the tank
  addSgram <- targetSgram - currentSgram
  #volume of high salinity seawater (L) that needs to added to the tank
  addHighSwaterVol <- addSgram / highSwater
  # add DI water volume to fill the tank (L)
  addDIwaterVol <- targetVol - addHighSwaterVol - initVol
  #return list of head tank calculation values
  return(list(targetSgram = targetSgram, 
                       currentSgram = currentSgram, 
                       addSgram = addSgram, 
                       addHighSwaterVol = addHighSwaterVol,
                       addDIwaterVol = addDIwaterVol))
}

#calculation if initial volume is 20 L at 42 ppt (normally inital salinity will be near 30 ppt)
# with a target final volume of 90 L at 30 ppt
# and the high salinity tank is at 61 ppt
fillTankS <- addHighSalwater(20, 42, 90, 30, 61)

# these are the two output values that you need
fillTankS$addHighSwaterVol
fillTankS$addDIwaterVol

# as an implementation strategy, we could set a target salinity slightly below our real target
# then rapidly add the high salinity and DI water to reach this lower target based on these calulations
# then slowly add high S water with equilibration time to reach target based on condutivity probe



