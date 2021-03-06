% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/affine.R
\docType{class}
\name{RMulExpression-class}
\alias{RMulExpression-class}
\alias{RMulExpression}
\alias{is_incr,RMulExpression-method}
\alias{is_decr,RMulExpression-method}
\alias{graph_implementation,RMulExpression-method}
\title{The RMulExpression class.}
\usage{
\S4method{is_incr}{RMulExpression}(object, idx)

\S4method{is_decr}{RMulExpression}(object, idx)

\S4method{graph_implementation}{RMulExpression}(object, arg_objs, size,
  data = NA_real_)
}
\arguments{
\item{object}{A \linkS4class{RMulExpression} object.}

\item{idx}{An index into the atom.}

\item{arg_objs}{A list of linear expressions for each argument.}

\item{size}{A vector with two elements representing the size of the resulting expression.}

\item{data}{A list of additional data required by the atom.}
}
\description{
This class represents the matrix product of an expression with a constant on the right.
}
\section{Methods (by generic)}{
\itemize{
\item \code{is_incr}: Is the right-hand expression positive?

\item \code{is_decr}: Is the right-hand expression negative?

\item \code{graph_implementation}: The graph implementation of the expression.
}}

\seealso{
\linkS4class{MulExpression}
}
