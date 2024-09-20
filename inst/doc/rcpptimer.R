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
Rcpp::cppFunction("
double add(double &x, double &y)
{
 Rcpp::Timer timer;
 timer.tic();
 double z = x + y;
 timer.toc();
 return(z);
}",
  depends = "rcpptimer"
)

add(rnorm(1), runif(1))

## ----eval = TRUE--------------------------------------------------------------
print(times)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double add(double &x, double &y)
{
 Rcpp::Timer timer;
 timer.tic("body");
 timer.tic("add_1");
 timer.tic("add_2");
 double z = x + y;
 timer.toc("add_1");
 timer.toc("add_2");
 timer.toc("body");
 return(z);
}',
  depends = "rcpptimer"
)

add(rnorm(1), runif(1))

print(times)

## ----eval = TRUE--------------------------------------------------------------
results <- rcpptimer::fibonacci_omp(n = rep(20:25, 10))
print(times)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double add(double &x, double &y)
{
 Rcpp::Timer timer;
 Rcpp::Timer::ScopedTimer scoped_timer(timer, "add");
 double z = x + y;
 return(z);
}',
  depends = "rcpptimer"
)

add(rnorm(1), runif(1))

print(times)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double add(double &x, double &y)
{
 Rcpp::Timer timer;
 Rcpp::Timer::ScopedTimer scoped_timer(timer, "add");
 timer.tic("add");
 double z = x + y;
 timer.toc("ad");
 return(z);
}',
  depends = "rcpptimer"
)

add(rnorm(1), runif(1))

## ----eval = TRUE--------------------------------------------------------------
print(times)

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double add(double &x, double &y)
{
 Rcpp::Timer timer(false);
 Rcpp::Timer::ScopedTimer scoped_timer(timer, "add");
 timer.tic("add");
 double z = x + y;
 timer.toc("ad");
 return(z);
}',
  depends = "rcpptimer"
)

add(rnorm(1), runif(1))

print(times)

