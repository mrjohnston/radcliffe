// soil moisture phenology  analysis
// with test data

// 2 level model for budburst day (or other phenophase)  as a function of above-ground temperature, soil moisture, and their interaction
// Levels: just Species for now

data {
	int<lower=1> N;
	int<lower=1> n_sp;
	int<lower=1, upper=n_sp> sp[N];
	vector[N] y; 		// response
	vector[N] temp; 	// predictor
	vector[N] mois; 	// predictor
	
	}

transformed data {
  vector[N] inter_tm;           
  inter_tm    = temp .* mois;  
  	 
  	 }
  	 
parameters {
  real mu_a_sp;// intercept for species
  real mu_b_temp_sp;   
  real mu_b_mois_sp;      
  real mu_b_tm_sp; // slope of temp x mois effect
  real<lower=0> sigma_a_sp;
  real<lower=0> sigma_b_temp_sp;
  real<lower=0> sigma_b_mois_sp;
  real<lower=0> sigma_b_tm_sp;
  real<lower=0> sigma_y; 

  real a_sp[n_sp]; // intercept for species
  real b_temp[n_sp]; // species-level effect of temp
  real b_mois[n_sp]; // species-level effect of mois
  real b_tm[n_sp]; // species-level interaction of temp*mois
	}

transformed parameters {
   real yhat[N];
       	for(i in 1:N){
           yhat[i] = a_sp[sp[i]] + // indexed with species
		      b_temp[sp[i]] * temp[i] + 
	      	b_mois[sp[i]] * mois[i] +
          b_tm[sp[i]] * inter_tm[i];
			     	}
	}

model {

	  a_sp ~ normal(mu_a_sp, sigma_a_sp); 
    mu_a_sp ~ normal(0, 200);
    sigma_a_sp ~ normal(0, 10);
	  b_temp ~ normal(mu_b_temp_sp, sigma_b_temp_sp); 
    mu_b_temp_sp ~ normal(0, 10);
    sigma_b_temp_sp ~ normal(0, 5);
    b_mois ~ normal(mu_b_mois_sp, sigma_b_mois_sp); 
    mu_b_mois_sp ~ normal(0, 10);
    sigma_b_mois_sp ~ normal(0, 5);
    b_tm ~ normal(mu_b_tm_sp, sigma_b_tm_sp);
    mu_b_tm_sp ~ normal(0, 10);
    sigma_b_tm_sp ~ normal(0, 5);
	  y ~ normal(yhat, sigma_y);
}

