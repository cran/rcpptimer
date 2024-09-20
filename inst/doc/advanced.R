## ----eval = TRUE--------------------------------------------------------------
Rcpp::cppFunction('
DataFrame demo_rnorm()
{
  Rcpp::Timer timer;
  double x=0;
  for(int i = 0; i < 7; i++)
  {
    timer.tic("rnorm");
    x += rnorm(1, 1)[0];
    timer.toc("rnorm");
  }
  DataFrame times = DataFrame::create(
          Named("Durations") = timer.durations,
          Named("Tags") = timer.tags);
  return(times);
}',
  depends = "rcpptimer"
)

demo_rnorm()

## ----eval = TRUE--------------------------------------------------------------
rcpptimer:::test_update()

## ----eval = TRUE--------------------------------------------------------------
rcpptimer:::test_reset()

