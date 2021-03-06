% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lpsolve_solver.R
\docType{methods}
\name{status_map,LPSOLVE-method}
\alias{status_map,LPSOLVE-method}
\title{LPSOLVE Status Map}
\usage{
\S4method{status_map}{LPSOLVE}(solver, status)
}
\arguments{
\item{solver}{A \linkS4class{LPSOLVE} object.}

\item{status}{An exit code returned by LPSOLVE.}
}
\value{
A string indicating the status, either "optimal", "infeasible", "unbounded", "optimal_inaccurate", "infeasible_inaccurate", "unbounded_inaccurate", or "solver_error".
}
\description{
Map of LPSOLVE status to CVXR status.
}
