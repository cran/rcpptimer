## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double demo_rnorm()
{
 Rcpp::Timer timer("mytimes");
 timer.tic();
 double x = rnorm(1, 1)[0];
 timer.toc();
 return(x);
}',
  depends = "rcpptimer"
)

demo_rnorm()

print(mytimes)

## ----eval = TRUE, echo = FALSE------------------------------------------------
rm(list = ls())

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double demo_rnorm()
{
 Rcpp::Timer timer;
 timer.autoreturn = false;
 timer.tic("rnorm");
 double x = rnorm(1, 1)[0];
 timer.toc("rnorm");
 return(x);
}',
  depends = "rcpptimer"
)

demo_rnorm()

print(ls())

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
DataFrame demo_rnorm()
{
 Rcpp::Timer timer;
 timer.autoreturn = false;
 timer.tic("rnorm");
 double x = rnorm(1, 1)[0];
 timer.toc("rnorm");
 DataFrame times = timer.stop();
 return(times);
}',
  depends = "rcpptimer"
)

demo_rnorm()

## ----eval = TRUE, echo = FALSE------------------------------------------------
rm(list = ls())

## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
double demo_rnorm(bool return_timings = false,
 const char* timings_name = "times")
{
 Rcpp::Timer timer(timings_name);
 timer.autoreturn = return_timings;
 timer.tic("rnorm");
 double x = rnorm(1, 1)[0];
 timer.toc("rnorm");
 return(x);
}',
  depends = "rcpptimer"
)

demo_rnorm(return_timings = FALSE)
ls()
demo_rnorm(return_timings = TRUE)
ls()
demo_rnorm(return_timings = TRUE, timings_name = "my_times")
ls()

