% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/movement.R
\name{plot.movement_predictions}
\alias{plot.movement_predictions}
\title{Plot movement predictions}
\usage{
\method{plot}{movement_predictions}(x, ...)
}
\arguments{
\item{x}{A \code{movement_predictions} object}

\item{\dots}{Extra parameters to pass to plot}
}
\description{
Given a predicted movement model (that is a \code{movement_predictions} object),
plot the underlying raster, the configured location points and the predicted movements
between locations.
}
\examples{
\dontrun{
# get location data
data(kenya)
kenya10 <- raster::aggregate(kenya, 10, sum)
net <- getNetwork(kenya10, min = 50000)
locationData <- data.frame(location = net$locations,
                           population = net$population,
                           x = net$coordinate[,1],
                           y = net$coordinate[,2])
locationData  <- as.location_dataframe(locationData)
# simulate movements (note the values of movementmatrix must be integer)
predictedMovement  <- predict(radiationWithSelection(theta = 0.5), locationData, symmetric = TRUE)
movementMatrix <- round(predictedMovement$movement_matrix)
# fit a new model to these data
movement_model <- movement(movementMatrix ~ locationData, radiationWithSelection(theta = 0.5))
# predict the population movements
predicted_movements  <- predict(movement_model, kenya10)
# display the predicted movements
plot(predicted_movements)
}
}

