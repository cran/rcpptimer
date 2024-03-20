## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  # dev = "svg",
  warning = TRUE,
  message = FALSE,
  comment = "#>"
)
Sys.setenv("OMP_THREAD_LIMIT" = 2)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
int mem()
{
  Rcpp::Timer timer;
  timer.tic("mem");
  std::string s;
  s.reserve(1048576);
  timer.toc("mem");
  return(0);
}',
  depends = "rcpptimer"
)

mem()

print(times)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
int mem()
{
  Rcpp::Timer timer("mytimes");
  timer.tic("mem");
  std::string s;
  s.reserve(1048576);
  timer.toc("mem");
  return(0);
}',
  depends = "rcpptimer"
)

mem()

print(mytimes)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
int mem()
{
  Rcpp::Timer timer;
  timer.tic("start");
  std::string s;
  timer.tic("reserve");
  s.reserve(1048576);
  timer.toc("reserve");
  timer.toc("finish");
  return(0);
}',
  depends = "rcpptimer"
)

mem()

print(times)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
int mem()
{
  Rcpp::Timer timer(false); // Disable warnings
  timer.tic("start");
  std::string s;
  timer.tic("reserve");
  s.reserve(1048576);
  timer.toc("reserve");
  timer.toc("finish");
  return(0);
}',
  depends = "rcpptimer"
)

mem()

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
int mem()
{
  Rcpp::Timer timer;
  Rcpp::Timer::ScopedTimer scoped_timer(timer, "mem");
  std::string s;
  s.reserve(1048576);
  return(0);
}',
  depends = "rcpptimer"
)

mem()

print(times)

