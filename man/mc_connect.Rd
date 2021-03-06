% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connect.R
\name{mc_connect}
\alias{mc_connect}
\title{Create a connection to a Minecraft server}
\usage{
mc_connect(
  hostname = Sys.getenv("SPIGOT_HOSTNAME", "localhost"),
  port = Sys.getenv("SPIGOT_PORT", "4711")
)
}
\arguments{
\item{hostname}{A character string with the hostname or IP address for the
Minecraft Spigot server to which you want to connect.}

\item{port}{An integer giving the port to use for the connection.}
}
\value{
Nothing returned, the connection is cached within the package namespace.
}
\description{
Create a connection to a Minecraft server
}
\examples{
\dontrun{
mc_connect()
getPlayerIds()
mc_close()
}

}
