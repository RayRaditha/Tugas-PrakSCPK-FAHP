function [RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
indeksAcak = [0 0 0.59 0.9 1.22 1.34 1.42 1.51 1.65 1.79];
 
[op, jumlahKriteria] = size(relasiAntarKriteria);

[opp, lambda] = eig(relasiAntarKriteria);

%Menentukan maksimal nilai lambda yang telah dihitung sebelumnya
maksLambda = max(max(lambda));
 
%Menentukan nilai indeks konsistensi dengan rumus (maksLambda-n)/(n-1)
IndeksKonsistensi = (maksLambda - jumlahKriteria)/(jumlahKriteria-1);
 
%Menghitung rasio konsistensi untuk mendapatkan jawaban akhir
RasioKonsistensi = IndeksKonsistensi/indeksAcak(1,jumlahKriteria);
 
%Jika nilai rasio konsistensi lebih dari 0.1, maka tampilkan pesan kesalahan
    if RasioKonsistensi > 0.10
        str = 'Rasio Konsistensi adalah %% %1.2f. Matriks yang dievaluasi tidak konsisten!';
        str = sprintf(str,RasioKonsistensi);
        disp(str);
    end
end