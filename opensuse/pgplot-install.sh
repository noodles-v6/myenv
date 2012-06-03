#!/bin/bash 
#

PGPLOT_DIR=/usr/local/pgplot
PGPLOT_TMP=/usr/local/src/pgplot

cp pgplot5.2.tar.gz /usr/local/src 
cd /usr/local/src 
tar -zxvf pgplot5.2.tar.gz

if [ ! -e ${PGPLOT_DIR} ]; then
	mkdir ${PGPLOT_DIR} 
fi

cp ${PGPLOT_TMP}/src/grpckg1.inc grpckg1.inc.bak
cp ${PGPLOT_TMP}/src/pgplot.inc  pgplot.inc.bak

sed -i 's#PARAMETER \(GRIMAX = 8\)#PARAMETER \(GRIMAX = 32\)#' ${PGPLOT_TMP}/src/grpckg1.inc 
sed -i 's#PARAMETER \(GRIMAX = 8\)#PARAMETER \(GRIMAX = 32\)#' ${PGPLOT_TMP}/src/pgplot.inc 

#
#
cd ${PGPLOT_DIR}

cp ${PGPLOT_TMP}/drivers.list .
sed -i 's#! PNDRIV 1 /PNG#  PNDRIV 1 /PNG#' drivers.list 

# prepares the makefile for linux system + gcc complier
${PGPLOT_TMP}/makemake ${PGPLOT_TMP} linux 977_gcc 

sed -i 's#FCOMPL=g77#FCOMPL=gfortran#' makefile
sed -i 's#FFLANG=-u -Wall -fPIC -O#FFLANG=-ffixed-form -ffixed-line-length-none -u -Wall -fPIC -O#'
makefile

make 

make cpg

make clean

cd /usr/local/bin 

ln -s -f ${PGPLOT_DIR}/libpgplot.a  libpgplot.a
ln -s -f ${PGPLOT_DIR}/libcpgplot.a libcpgplot.a

cp ${PGPLOT_DIR}/libpgplot.so .

echo '/usr/local/lib' >> /etc/ld.so.conf 

/sbin/ldconfig -v

ln -s -f ${PGPLOT_DIR}/cpgplot.h /usr/local/include/cpgplot.h

# check if env has been set
echo 'PGPLOT_DIR=/usr/local/pgplot/' >> /root/.bashrc
echo 'PGPLOT_DEV=/xwin' >> /root/.bashrc


