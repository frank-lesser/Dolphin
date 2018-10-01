/******************************************************************************

	File: STBlockInfo.h

	Description:

******************************************************************************/

typedef struct BlockInfo
{
	// Bottom bit of flags must be 1
	BYTE isInteger;
	BYTE argumentCount;				// Number of arguments expected
	BYTE stackTempsCount;			// Number of extra temp slots to allocate in the stack when activated
	BYTE envTempsCount;				// Number of shared temps slots to allocate in heap context when activated
} BlockInfo;