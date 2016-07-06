/* Copyright 2016 The Science and Technology Facilities Council (STFC)
 *
 * Authors: Jonathan Hogg (STFC)
 *
 * IMPORTANT: This file is NOT licenced under the BSD licence. If you wish to
 * licence this code, please contact STFC via hsl@stfc.ac.uk
 * (We are currently deciding what licence to release this code under if it
 * proves to be useful beyond our own academic experiments)
 *
 */
#include "SymbolicSubtree.hxx"

using namespace spral::ssids::cpu;

extern "C"
void* spral_ssids_cpu_create_symbolic_subtree(int nnodes, int const* sptr, long const* rptr, int const* rlist) {
   return (void*) new SymbolicSubtree(nnodes, sptr, rptr, rlist);
}

extern "C"
void spral_ssids_cpu_destroy_symbolic_subtree(void* target) {
   auto *subtree = static_cast<SymbolicSubtree*>(target);
   delete subtree;
}