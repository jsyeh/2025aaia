// LeetCode 838. Push Dominoes
// ���u���P�v�G�� n �Ӱ��P�Ʀ��@�u, �C�Ӱ��P�i�u���k�� or �������v
// �C�j�@��, �F��1�Ӱ��P�|���v�T�ӭˤU�C�Y��n�u���k�F�~���V�A�ˡv�N�|�O������/���ߡC
class Solution {
public:
    string pushDominoes(string dominoes) {
        int N = dominoes.length(); // �`�@�� N �Ӱ��P
        int force[N]; // �ΤO�q,�ӫ�� ���k�˪��O,�|�O���� (�����˪��O,�O�t��)
        int energy = 0;
        for(int i=0; i<N; i++){ // ���k���O
            if(dominoes[i]=='R') energy = N; // �P�V, �R����q
            else if(dominoes[i]=='L') energy = 0; // �f�V, ��q�S�F
            else if(energy>0) energy--; // ��q�C�C�ܤp
            force[i] = energy;
        }
        energy = 0;
        for(int i=N-1; i>=0; i--){ // �������O
            if(dominoes[i]=='L') energy = N; // �R��
            else if(dominoes[i]=='R') energy = 0; // �f�V, ��q�S�F
            else if(energy>0) energy--;
            force[i] -= energy;

            if(force[i]==0) dominoes[i]='.'; // �A�ݳ̫᪺�O,�O���ߡB���k�B����
            else if(force[i]>0) dominoes[i] = 'R';
            else dominoes[i] = 'L';
        }
        return dominoes;
    }
};
