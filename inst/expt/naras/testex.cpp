#include <Rcpp.h>
using namespace Rcpp  ;

#define DBG(MSG,X) Rprintf("%20s SEXP=<%p>. List=%p\n", MSG, (SEXP)X, &X ) ;

void fun_copy( List x, const char* idx ){
    x[idx] = "foo" ;
    DBG( "in fun_copy: ", x) ;

}
void fun_ref( List& x, const char* idx ){
    x[idx] = "bar" ;
    DBG( "in fun_ref: ", x) ;
}


// [[Rcpp::export]]
void test_copy(){

    // create a list of 3 components
    List data = List::create( _["a"] = 1, _["b"] = 2 ) ;
    DBG( "initial: ", data) ;

    fun_copy( data, "a") ;
    DBG( "\nafter fun_copy (1): ", data) ;

    // alter the 1st component of ths list, passed by value
    fun_copy( data, "d") ;
    DBG( "\nafter fun_copy (2): ", data) ;


}

// [[Rcpp::export]]
void test_ref(){

    // create a list of 3 components
    List data = List::create( _["a"] = 1, _["b"] = 2 ) ;
    DBG( "initial: ", data) ;

    fun_ref( data, "a") ;
    DBG( "\nafter fun_ref (1): ", data) ;

    // alter the 1st component of ths list, passed by value
    fun_ref( data, "d") ;
    DBG( "\nafter fun_ref (2): ", data) ;


}
