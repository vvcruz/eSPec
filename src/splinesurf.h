//FORTRAN SPLINE ROUTINES

void dbsnak_ (int *nx,double *xvec, int *kxord, double *xknot);
void dbs2in_ (int *nx,double *xvec,int *ny,double *yvec,double *xydata,int *ldf,int *kx,int *ky, double *xknot,double *yknot,double *bcoef);
void dbs3in_ (int *nx,double *xvec,int *ny,double *yvec,int *nz,double *zvec,double *xyzdata,int *ldf,int *mdf, int *kx,int *ky, int *kz, double *xknot,double *yknot,double *zknot,double *bcoef);

void coefcal_ (int *nx,double *xvec,int *ny,double *yvec,double *xydata,int *ldf,int *kx,int *ky, double *xknot,double *yknot,double *bcoef);
void splvalue_ (double *x,double *y,int *kx,int *ky,double *xknot,double *yknot, int *nx,int *ny,double *bcoef,double *Val);
double dbs2vl_ (double *x,double *y,int *kx,int *ky,double *xknot,double *yknot, int *nx,int *ny,double *bcoef);
double dbs3vl_ (double *x,double *y,double *z,int *kx,int *ky,int *kz,double *xknot,double *yknot,double *zknot, int *nx,int *ny,int *nz,double *bcoef);

void dbsint_ (int *nx,double *xvec,double *xdata,int *kx,double *xknot,double *bcoef);
double dbsval_ (double *x,int *kx,double *xknot,int *nx,double *bcoef);
