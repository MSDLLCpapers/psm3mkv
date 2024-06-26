% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resmeans.R
\name{rmd_pd_stm_cr}
\alias{rmd_pd_stm_cr}
\title{Restricted mean duration in progressed disease state for clock reset state transition model}
\usage{
rmd_pd_stm_cr(dpam, Ty = 10, starting = c(1, 0, 0), discrate = 0)
}
\arguments{
\item{dpam}{List of survival regressions for model endpoints. These must include time to progression (TTP) and pre-progression death (PPD).}

\item{Ty}{Time duration over which to calculate. Assumes input is in years, and patient-level data is recorded in weeks.}

\item{starting}{Vector of membership probabilities at time zero.}

\item{discrate}{Discount rate (\%) per year}
}
\value{
Numeric value in same time unit as patient-level data (weeks).
}
\description{
Calculates the mean duration in the progressed disease state for the clock reset state transition model. Requires a carefully formatted list of fitted survival regressions for necessary endpoints, and the time duration to calculate over.
}
\examples{
# Create dataset and fit survival models (splines)
bosonc <- create_dummydata("flexbosms")
fits <- fit_ends_mods_spl(bosonc)
# Pick out best distribution according to min AIC
params <- list(
  ppd = find_bestfit_spl(fits$ppd, "aic")$fit,
  ttp = find_bestfit_spl(fits$ttp, "aic")$fit,
  pfs = find_bestfit_spl(fits$pfs, "aic")$fit,
  os = find_bestfit_spl(fits$os, "aic")$fit,
  pps_cf = find_bestfit_spl(fits$pps_cf, "aic")$fit,
  pps_cr = find_bestfit_spl(fits$pps_cr, "aic")$fit
)
rmd_pd_stm_cr(dpam=params)
}
\seealso{
\link{rmd_pd_stm_cr}

Used safely as \link{prmd_pd_stm_cr} by \link{calc_allrmds}
}
