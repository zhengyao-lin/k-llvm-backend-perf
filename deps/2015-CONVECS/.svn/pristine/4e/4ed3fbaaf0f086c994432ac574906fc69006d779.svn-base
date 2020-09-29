/* Hubert Garavel - 2016-05-27 */

#include "caesar_graph.h"

CAESAR_TYPE_NATURAL caesar_nb_transitions;

/*---------------------------------------------------------------------------*/

static void caesar_abort (caesar_signal)
CAESAR_TYPE_GENUINE_INT caesar_signal;

{
     CAESAR_SET_SIGNALS (SIG_IGN);
     CAESAR_ERROR ("caught signal %d; exiting", caesar_signal);
}

/*---------------------------------------------------------------------------*/

static void caesar_add_transition (caesar_state_1, caesar_label, caesar_state_2)
CAESAR_TYPE_STATE caesar_state_1;
CAESAR_TYPE_STATE caesar_state_2;
CAESAR_TYPE_LABEL caesar_label;

{
     caesar_use (caesar_state_1);
     caesar_use (caesar_state_2);
     CAESAR_PRINT_LABEL (stdout, caesar_label);
     fprintf (stdout, "\n");
     caesar_nb_transitions++;
}

/*---------------------------------------------------------------------------*/

CAESAR_TYPE_GENUINE_INT main ()
{
     CAESAR_TYPE_STATE caesar_state_1, caesar_state_2;
     CAESAR_TYPE_LABEL caesar_label;

     CAESAR_SET_SIGNALS (caesar_abort);

     CAESAR_INIT_GRAPH ();

     CAESAR_CREATE_STATE (&caesar_state_1);
     CAESAR_CREATE_STATE (&caesar_state_2);
     CAESAR_CREATE_LABEL (&caesar_label);

     CAESAR_START_STATE (caesar_state_1);

     while (CAESAR_TRUE) {
	  caesar_nb_transitions = 0;
	  CAESAR_ITERATE_STATE (caesar_state_1, caesar_label, caesar_state_2, caesar_add_transition);
	  if (caesar_nb_transitions == 0) {
	       break;
	  } else if (caesar_nb_transitions > 1) {
	       printf ("non-determinism found\n");
	       exit (1);
	  }
	  CAESAR_COPY_STATE (caesar_state_1, caesar_state_2);
     }
     CAESAR_DELETE_STATE (&caesar_state_1);
     CAESAR_DELETE_STATE (&caesar_state_2);
     CAESAR_DELETE_LABEL (&caesar_label);

     return (0);
}

/*---------------------------------------------------------------------------*/
